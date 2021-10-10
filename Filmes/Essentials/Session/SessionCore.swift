//
//  SessionCore.swift
//  SessionCore
//
//  Created by Filipe Oliveira on 10/10/21.
//

import Foundation

public class SessionCore {
  private static var sharedSessionManager: SessionCore?
  public let session: SessionData
  public var apiKey: String = "5bb425e36318deff6fd66b834ae1e726"
  public var serverSecureBaseUrl: String = "https://api.themoviedb.org/3/"
  public var defaultLanguage: String = "pt-BR"
  
  public static var shared: SessionCore {
    guard let session = sharedSessionManager else {
      fatalError("")
    }
    return session
  }
  
  private init(sessionData: SessionData) {
    self.session = sessionData
  }
}

extension SessionCore {
  static func createSession(_ sessionData: SessionData) {
    sharedSessionManager = SessionCore(sessionData: sessionData)
  }
  
  static func cleanSession() {
    SessionCore.sharedSessionManager = nil
  }
}
