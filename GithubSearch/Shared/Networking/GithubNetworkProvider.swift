//
//  GithubNetworkProvider.swift
//  GithubSearch
//
//  Created by Yunus Yılmaz on 07/11/24.
import Foundation
import Combine

protocol GithubNetworkProvider {
    func getRepos(username: String) -> AnyPublisher<[Repo], Error>
    func getRepo(username: String, name: String) -> AnyPublisher<Repo, Error>
    func getUser(username: String) -> AnyPublisher<User, Error>
}

class GithubNetworkClient: GithubNetworkProvider {
    var networkClient: NetworkProvider = NetworkClient.instance
    
    func getRepos(username: String) -> AnyPublisher<[Repo], Error> {
        networkClient.request(GithubRouter.repos(username: username)).decode()
    }
    
    func getRepo(username: String, name: String) -> AnyPublisher<Repo, Error> {
        networkClient.request(GithubRouter.repo(username: username, name: name)).decode()
    }
    
    func getUser(username: String) -> AnyPublisher<User, Error> {
        networkClient.request(GithubRouter.user(username: username)).decode()
    }
}
