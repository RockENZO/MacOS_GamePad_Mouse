//
//  MacOS_GamePad_MouseApp.swift
//  MacOS_GamePad_Mouse
//
//  Created by Rock on 13/6/2025.
//

import SwiftUI

@main
struct MacOS_GamePad_MouseApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var gamepadManager = GamepadManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gamepadManager)
        }
    }
}
