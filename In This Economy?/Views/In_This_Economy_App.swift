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
import SwiftUI

@main
struct In_This_Economy_App: App {
    @Environment(\.openWindow) var openWindow
    @State var isFloating = false
    
    var body: some Scene {
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
                }
                
                Window("About In This Economy", id: "about") {
                    AboutView()
                        .containerBackground(.ultraThickMaterial, for: .window)
                        .windowMinimizeBehavior(.disabled)
                        .windowFullScreenBehavior(.disabled)
                        .windowResizeBehavior(.disabled)
                }
                .windowResizability(.contentSize)
            }
    
    init() {
        do {
            try Tips.configure()
        } catch {
            print("There was an error configuring the tips")
        }
    }
}
