//
//  RateView-ViewModel.swift
//  In This Economy?
//
//  Created by Jan Schmidt on 21.10.26.
//

import Foundation
import InflationKit
import SwiftUI

extension RateView {
    @Observable
    class ViewModel {
        var country: Country = .unitedStates
        var inflationCalculator = InflationCalculator()
        
        var startDate = Date.now
        var endDate = Date.now
        
        var calculatedRate = ""
        
        func getRate() {
            inflationCalculator.country = country
            inflationCalculator.start = startDate
            inflationCalculator.end = endDate
            
            Task {
                do {
                    let rateDouble = try await inflationCalculator.calculateInflationRate()
                    calculatedRate = String(rateDouble)
                } catch {
                    calculatedRate = "Oops. something went wrong"
                }
            }
        }
        
        func copyToClipboard() {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(calculatedRate, forType: .string)
        }
    }
}
