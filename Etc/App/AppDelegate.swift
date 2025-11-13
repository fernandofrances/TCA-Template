//
//  AppDelegate.swift
//  Etc
//
//  Created by Fernando Frances on 9/11/25.
//

import ComposableArchitecture

@Reducer
struct AppDelegateFeature {
    @ObservableState
    struct State {}
    
    enum Action {
        case didFinishLaunching
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .didFinishLaunching:
            return .none
        }
    }
}
