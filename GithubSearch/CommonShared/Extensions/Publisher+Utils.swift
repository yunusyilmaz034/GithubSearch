//
//  Publisher+Utils.swift
//  GithubSearch
//
//  Created by Yunus Yılmaz on 07/11/24.

import Combine

extension Publisher {
    func optionalize() -> Publishers.Map<Self, Self.Output?> {
        map({ Optional.some($0) })
    }
}
