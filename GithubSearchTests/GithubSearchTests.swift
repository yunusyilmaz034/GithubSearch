//
//  GithubSearchTests.swift
//  GithubSearchTests
//
//  Created by Yunus Yılmaz on 07/11/24.


import XCTest
import Combine
@testable import GithubSearchTests

class GithubSearchTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    // An example of network provider testing
    func testGithubNetworkProviderGetRepos() {
        let exp = expectation(description: "Parse repos success")
        var subscriptions = Set<AnyCancellable>()
        
        let networkClient = TestUtils.mockNetworkClient(file: "repos.json")
        let githubNetworkClient = GithubNetworkClient()
        githubNetworkClient.networkClient = networkClient
        
        githubNetworkClient.getRepos(username: "huynguyencong").sink { _ in } receiveValue: { repos in
            let firstRepo = repos.first
            let isCorrectParsing = firstRepo?.id != nil && firstRepo?.name != nil
            
            XCTAssert(isCorrectParsing)
            
            exp.fulfill()
        }.store(in: &subscriptions)

        wait(for: [exp], timeout: 0.5)
    }
    
    // An example of view model testing
    func testForkedRepoTextInRepoDetailsViewModel() {
        var repo = Repo()
        
        var sourceRepo = Repo()
        sourceRepo.fullName = "sourceOwnerName/SourceRepo"
        repo.source = Container(value: sourceRepo)
        
        let viewModel = RepoDetailsViewModel()
        viewModel.repo = repo
        XCTAssertEqual(viewModel.forkText, "Forked from \(sourceRepo.fullName ?? "")")
    }

}
