//
//  EtcApp.swift
//  Etc
//
//  Created by Fernando Frances on 9/11/25.
//

import ComposableArchitecture
import SwiftUI

@main
struct EtcApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            AppView(store: self.appDelegate.store)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.store.send(.appDelegate(.didFinishLaunching))
        return true
    }
}
