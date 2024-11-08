//
//  MockNetworkClient.swift
//  GithubSearchTests
//
//  Created by Yunus Yılmaz on 07/11/24.

import Foundation
import Combine
@testable import GithubSearch

class MockNetworkClient: NetworkProvider {
    var response: (Data?, Error?) = (nil, NetworkError.invalidResponse)
    
    init(response: (Data?, Error?)) {
        self.response = response
    }
    
    func request(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error> {
        if let error = response.1 {
            return Fail(error: error)
                .eraseToAnyPublisher()
        } else if let data = response.0 {
            return Just(data)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: NetworkError.invalidResponse)
                .eraseToAnyPublisher()
        }

    }
}
