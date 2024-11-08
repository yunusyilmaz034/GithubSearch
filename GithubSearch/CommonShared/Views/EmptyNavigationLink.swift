//
//  EmptyNavigationLink.swift
//  GithubSearch
//
//  Created by Yunus Yılmaz on 07/11/24.

import SwiftUI

struct EmptyNavigationLink<Destination>: View where Destination: View {
    let destination: Destination
    let isActive: Binding<Bool>
    
    init(destination: Destination, isActive: Binding<Bool>) {
        self.destination = destination
        self.isActive = isActive
    }
    
    init<T>(destination: Destination, selectedItem: Binding<T?>) {
        self.destination = destination
        self.isActive = selectedItem.map(valueToMappedValue: { $0 != nil }, mappedValueToValue: { _ in nil })
    }
    
    var body: some View {
        NavigationLink(
            destination: destination,
            isActive: isActive,
            label: {
                EmptyView()
            })
    }
}
