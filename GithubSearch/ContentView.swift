//
//  ContentView.swift
//  GithubSearch
//
//  Created by Yunus Yılmaz on 07/11/24.

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var searchText = ""
    
    var body: some View {
            NavigationStack(path: $path) {
                VStack {
                    TextField("Enter repository name", text: $searchText)
                          .foregroundColor(.blue)
                          .font(.largeTitle)
                          .multilineTextAlignment(.center)
                    Button("Search") {
                        path.append("Detail")
                    }
                }
                .navigationTitle("Reposotories search")
                .navigationDestination(for: String.self) { value in
                    if value == "Detail" {
                        RepoListCoordinator(username: searchText).environmentObject(NetworkMonitor())
                        
                    }
                }
            }
        }
    }
