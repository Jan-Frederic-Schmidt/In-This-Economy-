//
//  CountryEnumExtension.swift
//  In This Economy?
//
//  Created by Jan Schmidt on 01.11.26.
//

import AppIntents
import Foundation
import InflationKit

enum CountryOption: String, AppEnum {
    case germany, unitedStates, france, belarus, brazil, canada, eurozone, greece, india, japan, kazakhstan, mexico, russia, spain, europeanUnion, unitedKingdom, turkey, ukraine
    
    public static var typeDisplayRepresentation: TypeDisplayRepresentation {
        return TypeDisplayRepresentation(name: "Country")
    }
    
    public static var caseDisplayRepresentations: [CountryOption : DisplayRepresentation] {
        [
            .germany:        "Germany",
            .unitedStates:   "United States",
            .france:         "France",
            .belarus:        "Belarus",
            .brazil:         "Brazil",
            .canada:         "Canada",
            .eurozone:       "Eurozone",
            .greece:         "Greece",
            .india:          "India",
            .japan:          "Japan",
            .kazakhstan:     "Kazakhstan",
            .mexico:         "Mexico",
            .russia:         "Russia",
            .spain:          "Spain",
            .europeanUnion:  "European Union",
            .unitedKingdom:  "United Kingdom",
            .turkey:         "Türkiye",
            .ukraine:        "Ukraine"
        ]
    }
    
    var country: Country {
        switch self {
        case .germany:        return .germany
        case .unitedStates:   return .unitedStates
        case .france:         return .france
        case .belarus:        return .belarus
        case .brazil:         return .brazil
        case .canada:         return .canada
        case .eurozone:       return .eurozone
        case .greece:         return .greece
        case .india:          return .india
        case .japan:          return .japan
        case .kazakhstan:     return .kazakhstan
        case .mexico:         return .mexico
        case .russia:         return .russia
        case .spain:          return .spain
        case .europeanUnion:  return .europeanUnion
        case .unitedKingdom:  return .unitedKingdom
        case .turkey:         return .turkey
        case .ukraine:        return .ukraine
        }
    }
}
