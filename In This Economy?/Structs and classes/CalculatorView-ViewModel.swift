// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
// If a copy of the MPL was not distributed with this file,
// You can obtain one at https://mozilla.org/MPL/2.0/.
// Copyright © 2026 Jan Frédéric Schmidt


import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        var inflationCalculator = InflationCalculator()
        var country = Country(name: "united-states", displayName: "United States", oldestYear: 1913)
        
        var startDate = Date.now
        var endDate = Date.now
        var originalAmount = "100" {
            didSet {
                guard let double = Double(originalAmount) else {
                    // do something
                    return
                }
            }
        }
        
        var calculatedAmount = ""
        
        func getPrice() {
            inflationCalculator.country = country.name
            inflationCalculator.start = startDate.ISO8601Format(.iso8601Date(timeZone: .current))
            inflationCalculator.end = endDate.ISO8601Format(.iso8601Date(timeZone: .current))
            inflationCalculator.amount = originalAmount
            
            Task {
                do {
                    calculatedAmount = try await inflationCalculator.calculatePrice()
                } catch {
                    calculatedAmount = "Oops. something went wrong"
                }
            }
        }
    }
}
