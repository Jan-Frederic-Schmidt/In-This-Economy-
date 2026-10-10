// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
// If a copy of the MPL was not distributed with this file,
// You can obtain one at https://mozilla.org/MPL/2.0/.
// Copyright © 2026 Jan Frédéric Schmidt

import Foundation

// needs to be a class so that Hashable works
class Country: Equatable, Hashable {
    let name: String
    let displayName: LocalizedStringResource
    let oldestYear: Int
    
    init(name: String, displayName: LocalizedStringResource, oldestYear: Int) {
        self.name = name
        self.displayName = displayName
        self.oldestYear = oldestYear
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    static func ==(lhs: Country, rhs: Country) -> Bool {
        lhs.name == rhs.name
    }
}
