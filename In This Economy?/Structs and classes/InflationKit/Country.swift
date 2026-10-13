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

enum Country: String, CaseIterable {
    case germany = "germany"
    case unitedStates = "united-states"
    case france = "france"
    case belarus = "belarus"
    case brazil = "brazil"
    case canada = "canada"
    case eurozone = "eurozone"
    case greece = "greece"
    case india = "india"
    case japan = "japan"
    case kazakhstan = "kazakhstan"
    case mexico = "mexico"
    case russia = "russia"
    case spain = "spain"
    case europeanUnion = "european-union"
    case unitedKingdom = "united-kingdom"
    case turkey = "turkey"
    case ukraine = "ukraine"

    var identifier: String { rawValue }

    var displayName: LocalizedStringResource {
        switch self {
        case .germany:        return "Germany"
        case .unitedStates:   return "United States"
        case .france:         return "France"
        case .belarus:        return "Belarus"
        case .brazil:         return "Brazil"
        case .canada:         return "Canada"
        case .eurozone:       return "Eurozone"
        case .greece:         return "Greece"
        case .india:          return "India"
        case .japan:          return "Japan"
        case .kazakhstan:     return "Kazakhstan"
        case .mexico:         return "Mexico"
        case .russia:         return "Russia"
        case .spain:          return "Spain"
        case .europeanUnion:  return "European Union"
        case .unitedKingdom:  return "United Kingdom"
        case .turkey:         return "Türkiye"
        case .ukraine:        return "Ukraine"
        }
    }

    var oldestDate: Date {
        switch self {
        case .germany:        return Date(timeIntervalSince1970: -694_310_400)
        case .unitedStates:   return Date(timeIntervalSince1970: -1_798_761_600)
        case .france:         return Date(timeIntervalSince1970: -599_616_000)
        case .belarus:        return Date(timeIntervalSince1970: -1_861_920_000)
        case .brazil:         return Date(timeIntervalSince1970: 315_532_800)
        case .canada:         return Date(timeIntervalSince1970: -1_767_225_600)
        case .eurozone:       return Date(timeIntervalSince1970: 820_454_400)
        case .greece:         return Date(timeIntervalSince1970: -347_155_200)
        case .india:          return Date(timeIntervalSince1970: -63_158_400)
        case .japan:          return Date(timeIntervalSince1970: 0)
        case .kazakhstan:     return Date(timeIntervalSince1970: 662_688_000)
        case .mexico:         return Date(timeIntervalSince1970: -31_536_000)
        case .russia:         return Date(timeIntervalSince1970: 662_688_000)
        case .spain:          return Date(timeIntervalSince1970: -283_996_800)
        case .europeanUnion:  return Date(timeIntervalSince1970: 820_454_400)
        case .unitedKingdom:  return Date(timeIntervalSince1970: -725_846_400)
        case .turkey:         return Date(timeIntervalSince1970: 378_691_200)
        case .ukraine:        return Date(timeIntervalSince1970: 662_688_000)
        }
    }
}
