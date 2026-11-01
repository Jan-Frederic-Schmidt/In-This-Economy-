//
//  AdjustIntentShortcut.swift
//  In This Economy?
//
//  Created by Jan Schmidt on 01.11.26.
//

import AppIntents

struct AdjustIntentShortcut: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AdjustIntent(),
            phrases: [
                "Adjust for inflation in \(.applicationName)",
                "Adjust for inflation in \(\.$country) in \(.applicationName)"
            ],
            shortTitle: "Adjust for inflation",
            systemImageName: "chart.line.uptrend.xyaxis"
        )
    }
}
