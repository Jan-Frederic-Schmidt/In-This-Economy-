// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
// If a copy of the MPL was not distributed with this file,
// You can obtain one at https://mozilla.org/MPL/2.0/.
// Copyright © 2026 Jan Frédéric Schmidt

import SwiftUI

@main
struct In_This_Economy_App: App {
    @Environment(\.openWindow) var openWindow
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 300, minHeight: 300)
        }
        .windowStyle(.hiddenTitleBar)
        .defaultSize(width: 400, height: 400)
        .commands {
                    CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                        Button("About In This Economy") {
                            openWindow(id: "about")
                        }
                    }
                }
                
                Window("About In This Economy", id: "about") {
                    AboutView()
                        .containerBackground(.ultraThickMaterial, for: .window)
                        .windowMinimizeBehavior(.disabled)
                        .windowFullScreenBehavior(.disabled)
                }
                .windowResizability(.contentSize)
            }
        }
