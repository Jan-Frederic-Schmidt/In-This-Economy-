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
}
