//Copyright © 2026 Jan Frédéric Schmidt
//
//    This program is free software; you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation; either version 2 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License along
//    with this program; if not, write to the Free Software Foundation, Inc.,
//    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

import TipKit
import Sparkle
import SwiftUI

@main
struct In_This_Economy_App: App {
    @Environment(\.openWindow) var openWindow
    @FocusedValue(InflationCalculatorViewModel.self) var adjustmentViewModel: InflationCalculatorViewModel?
    @FocusedValue(RateViewModel.self) var rateViewModel: RateViewModel?
    
    @State var isFloating = false
    private let updaterController: SPUStandardUpdaterController
    
    var body: some Scene {
        // Windows
        WindowGroup {
            ContentView()
                .windowResizeBehavior(.disabled)
                .toolbar {
                    Toggle("Float", systemImage: "interface.window.on.rectangle", isOn: $isFloating)
                        .help("Keep window floating above other windows")
                        .popoverTip(FloatingTip())
                }
        }
        .windowLevel(isFloating ? .floating : .normal)
        .defaultSize(width: 400, height: 300)
        .commands {
            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                Button("About In This Economy") {
                    openWindow(id: "about")
                }
            }
            
            CommandGroup(after: .appInfo) {
                CheckForUpdatesView(updater: updaterController.updater)
            }
            
            CommandGroup(after: .pasteboard) {
                if let adjustmentViewModel {
                    Button("Copy output", action: adjustmentViewModel.copyToClipboard)
                        .keyboardShortcut("C", modifiers: [.option, .command])
                } else if let rateViewModel {
                    Button("Copy output", action: rateViewModel.copyToClipboard)
                        .keyboardShortcut("C", modifiers: [.option, .command])
                }
            }
        }
        
        Window("About In This Economy", id: "about") {
            AboutView()
                .containerBackground(.ultraThickMaterial, for: .window)
                .windowMinimizeBehavior(.disabled)
                .windowFullScreenBehavior(.disabled)
                .windowResizeBehavior(.disabled)
        }
            .windowResizability(.contentSize)
        
        // Menu bar
        MenuBarExtra("In This Economy?", systemImage: "chart.line.uptrend.xyaxis") {
            MenuBarView()
        }
        .menuBarExtraStyle(.window)
    }
    
    init() {
        // If you want to start the updater manually, pass false to startingUpdater and call .startUpdater() later
        // This is where you can also pass an updater delegate if you need one
        updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)
        
        do {
            try Tips.configure()
        } catch {
            print("There was an error configuring the tips")
        }
    }
}
