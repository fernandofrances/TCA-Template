//
//  User.swift
//  Etc
//
//  Created by Fernando Frances on 9/11/25.
//
import ComposableArchitecture
import Foundation

struct User: Identifiable {
    let id: UUID
    let name: String
    let email: String
    let googleId: String
    
    init(
        id: UUID? = nil,
        name: String,
        email: String,
        googleId: String
    ) {
        @Dependency(\.uuid) var uuid
        self.id = id ?? uuid()
        self.name = name
        self.email = email
        self.googleId = googleId
    }
}

extension User {
    public static var noob: Self {
        Self(name: "Fernando", email: "fernando95frances@gmail.com", googleId: "any-google-id")
    }
}
