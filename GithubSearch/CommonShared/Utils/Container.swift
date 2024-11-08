//
//  Container.swift
//  GithubSearch
//
//  Created by Yunus Yılmaz on 07/11/24.
import Foundation

struct Container<T: Codable>: Codable {
    private var values: [T] = []
    
    init(value: T) {
        self.value = value
    }
    
    var value: T {
        get {
            values.first!
        }
        
        set {
            values = [newValue]
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        value = try container.decode(T.self)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
