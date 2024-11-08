//
//  GithubSearch
//
//  Created by Yunus Yılmaz on 07/11/24.
//

import SwiftUI

struct RepoListCoordinator: View {
    @State private var selectedRepo: Repo?
    @State private var isProfilePresented = false
    
    @Environment(\.openURL) var openURL
    @EnvironmentObject var netWorkService: NetworkMonitor
    
    var username: String
    
    var body: some View {
        VStack {
            RepoListView(userNameObj: username, tapOnRepoAction: { repo in
                selectedRepo = repo
            }).environmentObject(netWorkService)
            .listStyle(PlainListStyle())
            .navigationBarTitle("\(username)'s repos", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                isProfilePresented = true
            }, label: {
                Image(systemName: "person.crop.circle")
            }))
            
            if let selectedRepo = selectedRepo {
                EmptyNavigationLink(destination: RepoDetailsView(inputRepo: selectedRepo, tapOnLinkAction: tapOnLinkAction), selectedItem: $selectedRepo)
            }
        }
        .fullScreenCover(isPresented: $isProfilePresented, content: {
            ProfileCoordinator(username: username)
        })
    }
    
    private func tapOnLinkAction(url: URL) {
        openURL(url)
    }
}
