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
import SwiftUI

extension AdjustmentView {
    @Observable
    class ViewModel {
        var country: Country = .unitedStates
        
        var startDate = Date.now
        var endDate = Date.now
        var originalAmount = 100.0
        
        var calculatedAmount = ""
        
        func getPrice() {
            InflationCalculator.shared.country = country
            InflationCalculator.shared.start = startDate
            InflationCalculator.shared.end = endDate
            InflationCalculator.shared.amount = originalAmount
            
            Task {
                do {
                    (calculatedAmount, _) = try await InflationCalculator.shared.calculatePrice()
                } catch {
                    calculatedAmount = "Oops. something went wrong"
                }
            }
        }
        
        func copyToClipboard() {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(calculatedAmount, forType: .string)
        }
    }
}
