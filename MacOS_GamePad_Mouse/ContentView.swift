//
//  ContentView.swift
//  MacOS_GamePad_Mouse
//
//  Created by Rock on 13/6/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gamepadManager: GamepadManager

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: gamepadManager.isConnected ? "gamecontroller.fill" : "gamecontroller")
                .imageScale(.large)
                .foregroundStyle(gamepadManager.isConnected ? .green : .red)
                .font(.system(size: 60))
            Text(gamepadManager.isConnected ? "Gamepad Connected" : "No Gamepad Connected")
                .font(.headline)
            if gamepadManager.isConnected {
                VStack {
                    Text("Left Thumbstick: x: \(String(format: "%.2f", gamepadManager.lastLeftThumbstick.x)), y: \(String(format: "%.2f", gamepadManager.lastLeftThumbstick.y))")
                    Text("Button A: \(gamepadManager.lastButtonA ? "Pressed" : "Released")")
                }
                .font(.subheadline)
            }
        }
        .padding()
        .frame(minWidth: 300, minHeight: 200)
    }
}

#Preview {
    ContentView()
        .environmentObject(GamepadManager())
}
