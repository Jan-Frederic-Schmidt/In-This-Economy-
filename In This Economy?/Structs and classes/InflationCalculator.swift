// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
// If a copy of the MPL was not distributed with this file,
// You can obtain one at https://mozilla.org/MPL/2.0/.
// Copyright © 2026 Jan Frédéric Schmidt

import Foundation

struct InflationCalculator {
    
    private let baseURL = "https://www.statbureau.org"
    
    var country = ""
    var start = ""
    var end = ""
    var amount = ""
    
    private enum CalculationError: Error {
        case urlError, decodingError, downloadingError
    }
    
    func calculatePrice() async throws -> String{
        var data = Data()
        
        guard let url = URL(string: "\(baseURL)/calculate-inflation-price-json") else { throw CalculationError.urlError }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            .init(name: "country", value: country),
            .init(name: "start", value: start),
            .init(name: "end", value: end),
            .init(name: "amount", value: amount),
            .init(name: "format", value: "true")
        ]
        
        do {
            print("\(components.url!)")
            let (downloaded, _) = try await URLSession.shared.data(from: components.url!)
            data = downloaded
        } catch {
            throw CalculationError.downloadingError
        }
        
        do {
             return try JSONDecoder().decode(String.self, from: data)
        } catch {
            throw CalculationError.decodingError
        }
    }
    
    let countryList: [Country] = [
        .init(name: "germany", displayName: "Germany", oldestYear: 1948),
        .init(name: "united-states", displayName: "United States", oldestYear: 1913),
        .init(name: "france", displayName: "France", oldestYear: 1951),
        .init(name: "belarus", displayName: "Belarus", oldestYear: 1911),
        .init(name: "brazil", displayName: "Brazil", oldestYear: 1980),
        .init(name: "canada", displayName: "Canada", oldestYear: 1914),
        .init(name: "eurozone", displayName: "Eurozone", oldestYear: 1996),
        .init(name: "greece", displayName: "Greece", oldestYear: 1959),
        .init(name: "india", displayName: "India", oldestYear: 1968),
        .init(name: "japan", displayName: "Japan", oldestYear: 1970),
        .init(name: "kazakhstan", displayName: "Kazakhstan", oldestYear: 1991),
        .init(name: "mexico", displayName: "Mexico", oldestYear: 1969),
        .init(name: "russia", displayName: "Russia", oldestYear: 1991),
        .init(name: "spain", displayName: "Spain", oldestYear: 1961),
        .init(name: "european-union", displayName: "European Union", oldestYear: 1996),
        .init(name: "united-kingdom", displayName: "United Kingdom", oldestYear: 1947),
        .init(name: "turkey", displayName: "Türkiye", oldestYear: 1982),
        .init(name: "ukraine", displayName: "Ukraine", oldestYear: 1991)
    ]
}
