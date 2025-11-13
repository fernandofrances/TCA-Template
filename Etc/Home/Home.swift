//
//  Home.swift
//  Etc
//
//  Created by Fernando Frances on 9/11/25.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct HomeFeature {
    @ObservableState
    struct State {
        var user: User
        init(user: User = .noob) {
            self.user = user
        }
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case task
    }
    
    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
                case .binding:
                return .none
            case .task:
                return .none
            }
        }
    }
}


struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    init(store: StoreOf<HomeFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack {
            Text("Home Feature!")
        }
        .padding()
    }
}

#Preview {
    HomeView(store: .init(initialState: HomeFeature.State(user: .init(name: "Any name", email: "Any email", googleId: "Any id")), reducer: {
        HomeFeature()
    }))
}
