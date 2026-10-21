////Copyright © 2026 Jan Frédéric Schmidt
////
////    This program is free software; you can redistribute it and/or modify
////    it under the terms of the GNU General Public License as published by
////    the Free Software Foundation; either version 2 of the License, or
////    (at your option) any later version.
////
////    This program is distributed in the hope that it will be useful,
////    but WITHOUT ANY WARRANTY; without even the implied warranty of
////    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
////    GNU General Public License for more details.
////
////    You should have received a copy of the GNU General Public License along
////    with this program; if not, write to the Free Software Foundation, Inc.,
////    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//import Foundation
//
//class InflationCalculator {
//    private let baseURL = "https://www.statbureau.org"
//    var country = Country.unitedStates
//    var start = Date()
//    var end = Date()
//    var amount = 100.0
//    
//    var calculatedPrice: (String?, Double?) = (nil, nil)
//    var calculatedRate: String? = nil
//    
//    // ---Adjust for inflation---
//    func calculatePrice() async throws -> (String, Double) {
//        var data = Data()
//        
//        guard let url = URL(string: "\(baseURL)/calculate-inflation-price-json") else { throw CalculationError.urlError }
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
//        components.queryItems = [
//            .init(name: "country", value: country.identifier),
//            .init(name: "start", value: start.ISO8601Format(.iso8601Date(timeZone: .current))),
//            .init(name: "end", value: end.ISO8601Format(.iso8601Date(timeZone: .current))),
//            .init(name: "amount", value: String(amount)),
//            .init(name: "format", value: "true")
//        ]
//        
//        do {
//            print("\(components.url!)")
//            let (downloaded, _) = try await URLSession.shared.data(from: components.url!)
//            data = downloaded
//        } catch {
//            throw CalculationError.downloadingError
//        }
//        
//        do {
//            let str = try JSONDecoder().decode(String.self, from: data)
//            print(str)
//            var duplicateStr = str
//            duplicateStr.unicodeScalars.removeAll { !CharacterSet.decimalDigits.contains($0) && $0 != "." }
//            print(duplicateStr)
//            let double = try Double(string: duplicateStr)
//            calculatedPrice = (str, double)
//            return (str, double)
//        } catch {
//            throw CalculationError.decodingError
//        }
//    }
//    
//    // ---Get inflation rate---
//    func calculateInflationRate() async throws -> String {
//        var data = Data()
//        
//        guard let url = URL(string: "\(baseURL)/calculate-inflation-rate-json") else { throw CalculationError.urlError }
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
//        components.queryItems = [
//            .init(name: "country", value: country.identifier),
//            .init(name: "start", value: start.ISO8601Format(.iso8601Date(timeZone: .current))),
//            .init(name: "end", value: end.ISO8601Format(.iso8601Date(timeZone: .current)))
//        ]
//        
//        do {
//            print("\(components.url!)")
//            let (downloaded, _) = try await URLSession.shared.data(from: components.url!)
//            data = downloaded
//        } catch {
//            throw CalculationError.downloadingError
//        }
//        
//        do {
//            let rate = try JSONDecoder().decode(String.self, from: data)
//            print(String(rate))
//            calculatedRate = rate
//            return rate
//        } catch {
//            throw CalculationError.decodingError
//        }
//    }
//    
//    private enum CalculationError: Error {
//        case urlError, decodingError, downloadingError
//    }
//}
