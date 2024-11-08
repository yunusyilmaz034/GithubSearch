//
//  RepoListViewModel.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation

class RepoListViewModel: ObservableObject {
    @Published var repos: [Repo] = []
    var networkClient: GithubNetworkProvider = GithubNetworkClient()
    
    func getRepos(username: String) {
        networkClient
            .getRepos(username: username)
            .replaceError(with: [])
            .assign(to: &$repos)
    }
}
