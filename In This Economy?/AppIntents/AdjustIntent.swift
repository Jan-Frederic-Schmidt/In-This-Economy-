//
//  AdjustIntent.swift
//  In This Economy?
//
//  Created by Jan Schmidt on 01.11.26.
//

import AppIntents
import Foundation
import InflationKit

struct AdjustIntent: AppIntent {
    public static var parameterSummary: some ParameterSummary {
        Summary("Adjust \(\.$amount) from \(\.$startDate) for inflation in \(\.$endDate) in \(\.$country)")
    }
    
    static let supportedModes: IntentModes = [.background,]
    
    static var title: LocalizedStringResource = "Adjust for inflation"
    
    static var description = IntentDescription("Adjust any price for inflation")
    
    @Parameter(title: "Country")
    var country: CountryOption
    
    @Parameter(title: "Start Date")
    var startDate: Date
    
    @Parameter(title: "End Date")
    var endDate: Date
    
    @Parameter(title: "Amount")
    var amount: Double
    
    // The logic that executes in the background
    func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog {
        let inflationCalculator = InflationCalculator()
        inflationCalculator.amount = amount
        inflationCalculator.country = country.country
        inflationCalculator.start = startDate
        inflationCalculator.end = endDate
        
        do {
            let (result, _) = try await inflationCalculator.calculatePrice()
        
            return .result(value: result, dialog: "Test dialog, \(result)")
        } catch {
            return .result(value: "Error", dialog: "Oops, something went wrong")
        }
    }
}
