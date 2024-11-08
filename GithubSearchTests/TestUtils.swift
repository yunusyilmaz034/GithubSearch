//
//  TestUtils.swift
//  GithubSearchTests
//
//  Created by Yunus Yılmaz on 07/11/24.


import Foundation

class TestUtils {
    static func loadData(file: String) -> Data? {
        guard let url = Bundle(for: Self.self).url(forResource: file, withExtension: nil), let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
    
    static func mockNetworkClient(file: String) -> MockNetworkClient {
        let data = loadData(file: file)
        return MockNetworkClient(response: (data, nil))
    }
}
