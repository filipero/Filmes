//
//  Bindable.swift
//  Bindable
//
//  Created by Filipe Oliveira on 09/10/21.
//

import Foundation

//https://www.swiftbysundell.com/posts/bindable-values-in-swift
public class Bindable<Value> {
  private var observations = [(Value) -> Bool]()
  public private(set) var lastValue: Value?

  public init(_ value: Value? = nil) {
    lastValue = value
  }
}

public extension Bindable {
  func update(with value: Value) {
    lastValue = value
    observations = observations.filter { $0(value) }
  }

  func addObservation<O: AnyObject>(
    for object: O,
    handler: @escaping (O, Value) -> Void
  ) {
    lastValue.map { value in
      if Thread.isMainThread {
        handler(object, value)
      } else {
        DispatchQueue.main.async {
          handler(object, value)
        }
      }
    }

    observations.append { [weak object] value in
      guard let object = object else {
        return false
      }
      if Thread.isMainThread {
        handler(object, value)
      } else {
        DispatchQueue.main.async {
          handler(object, value)
        }
      }
      return true
    }
  }
}

public extension Bindable {
  func clearObservations() {
    observations.removeAll()
  }

  func bind<O: AnyObject>(to objectKeyPath: ReferenceWritableKeyPath<O, Value>,
                          on object: O) {
    addObservation(for: object) { (object, value) in
      object[keyPath: objectKeyPath] = value
    }
  }

  func bind<O: AnyObject, T>(
    _ sourceKeyPath: KeyPath<Value, T>,
    to object: O,
    _ objectKeyPath: ReferenceWritableKeyPath<O, T>
  ) {
    addObservation(for: object) { object, observed in
      let value = observed[keyPath: sourceKeyPath]
      object[keyPath: objectKeyPath] = value
    }
  }

  func bind<O: AnyObject, T>(
    _ sourceKeyPath: KeyPath<Value, T>,
    to object: O,
    _ objectKeyPath: ReferenceWritableKeyPath<O, T?>
  ) {
    addObservation(for: object) { object, observed in
      let value = observed[keyPath: sourceKeyPath]
      object[keyPath: objectKeyPath] = value
    }
  }

  func bind<O: AnyObject, T, R>(
    _ sourceKeyPath: KeyPath<Value, T>,
    to object: O,
    _ objectKeyPath: ReferenceWritableKeyPath<O, R?>,
    transform: @escaping (T) -> R?
  ) {
    addObservation(for: object) { object, observed in
      let value = observed[keyPath: sourceKeyPath]
      let transformed = transform(value)
      object[keyPath: objectKeyPath] = transformed
    }
  }
}
