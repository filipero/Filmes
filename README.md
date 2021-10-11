# Imoovies

* [Instalacao](#instalacao)
* [Sobre o projeto](#sobre-o-projeto)
* [O Desafio](#o-desafio)

## Instalacao
O projeto não utiliza bibliotecas de terceiros, para executa-lo basta o Xcode 13.0 Beta 5.

## Sobre o projeto

### Arquitetura
Este projeto foi construído utilizando a arquitetura **MVVM**, composta por Model, View e ViewModel com os testes unitários e classes de Model.

## API
A api utilizada é a [The Movie Database API](https://developers.themoviedb.org/3).

## UI/Design
Paródia do iFood.

## Automaçao
O projeto não conta com automação.

## O Desafio
Criar um aplicativo de listagem de filmes através do consumo de uma API.

## O Aplicativo
### O que foi feito:
    - Sistema de sessão do app para armazenar informações como url da api, chave de api e linguagem preferida.
    - Alguns dos requests para a tela Início, sendo eles:
        - Request de Filmes Populares
        - Request de Filmes Em Cartaz
        - Request de Genêros
    - Layout da TabBar com navegação para as 4 telas:
        - Início
        - Busca
        - Assistidos
        - Perfil
    - Layout Listagem de Filmes em Cartaz
    - Layout Listagem de Filmes Populares
    - Layout Listagem de Genêros
    - Navegação para tela de Detalhes do Filme selecionado
    - Testes Unitários para a tela Início

### O que ainda não foi feito:
    - Layout Tela de Detalhes do Filme Selecionado
    - Layout Tela Busca
    - Layout Tela Assistidos
    - Layout Tela Perfil
    - Layout Tela Listagem De Filmes Por Genêro
    - Request Listagem de Filmes por Genêro
    - Request de Busca de Filme por Nome/Genero
    - Armazenar Filmes marcados como assistidos localmente.
    
    
### Ideias para o futuro:
    - Tornar a tela Início Dinâmica, podendo controlar as listagens mostradas através de um fluxo back-end.
    - Testes de UI
    - Fluxo de Login / Autenticação
    - Automação / CI/CD
    
### Telas

- Tela de Início
- Tela de Busca
- Tela de Assistidos
- Tela de Perfil
    - Tela de Detalhes

## Imagens
<img src="https://user-images.githubusercontent.com/28496460/136729811-2bbaf483-989a-4e5a-90c6-86e1507f123d.png" alt="logo" width="197" height="65">
<img src="https://user-images.githubusercontent.com/28496460/136729847-3e2ba0aa-a349-4357-8a40-971feb5c78a4.png" alt="icon" width="256" height="256">
<img src="https://user-images.githubusercontent.com/28496460/136730491-a9504673-5f9e-4ea5-82e8-2cf8d80b3d9e.png" alt="logo" width="206" height="449">

## Videos
https://user-images.githubusercontent.com/28496460/136733683-5cfd2a6a-eab4-410b-a080-637e8e98647a.mp4


