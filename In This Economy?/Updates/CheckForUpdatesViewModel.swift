//
//  CheckForUpdatesViewModel.swift
//  In This Economy?
//
//  Created by Jan Schmidt on 29.10.26.
//

import Combine
import Foundation
import Sparkle
import SwiftUI

// This view model class publishes when new updates can be checked by the user
final class CheckForUpdatesViewModel: ObservableObject {
    @Published var canCheckForUpdates = false

    init(updater: SPUUpdater) {
        updater.publisher(for: \.canCheckForUpdates)
            .assign(to: &$canCheckForUpdates)
    }
}
