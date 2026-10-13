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

import Foundation

extension CalculatorView {
    @Observable
    class ViewModel {
        var inflationCalculator = InflationCalculator()
        var country: Country = .unitedStates
        
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
            inflationCalculator.country = country.identifier 
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
