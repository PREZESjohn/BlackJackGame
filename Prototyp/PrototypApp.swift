//
//  PrototypApp.swift
//  Prototyp
//
//  Created by student on 17/12/2023.
//

import SwiftUI

@main
struct PrototypApp: App {
    @StateObject var game = BlackJackViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
