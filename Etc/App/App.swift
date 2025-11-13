//
//  App.swift
//  Etc
//
//  Created by Fernando Frances on 9/11/25.
//

import ComposableArchitecture
import Foundation
import SwiftUI

@Reducer
struct AppFeature {
    @ObservableState
    struct State {
        var appDelegate: AppDelegateFeature.State
        var home: HomeFeature.State
        
        init(appDelegate: AppDelegateFeature.State = .init(), home: HomeFeature.State = .init()) {
            self.home = home
            self.appDelegate = appDelegate
        }
    }
    
    enum Action: BindableAction {
        case appDelegate(AppDelegateFeature.Action)
        case binding(BindingAction<State>)
        case home(HomeFeature.Action)
        case start
    }
    
    @ReducerBuilder<State,Action>
    var core: some Reducer<State, Action> {
        Scope(state: \.appDelegate, action: \.appDelegate) {
            AppDelegateFeature()
        }
        
        Scope(state: \.home, action: \.home) {
            HomeFeature()
        }
        
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .appDelegate: return .none
            case .binding: return .none
            case .home: return .none
            case .start:  return .none
            }
        }
    }
}

struct AppView: View {
    @Bindable var store: StoreOf<AppFeature>
    
    var body: some View {
        HomeView(store: store.scope(state: \.home, action: \.home))
            .task {
                await store.send(.start).finish()
            }
    }
}

