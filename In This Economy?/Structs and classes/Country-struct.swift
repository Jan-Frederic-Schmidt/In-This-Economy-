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

//// needs to be a class so that Hashable works
//class Country: Equatable, Hashable {
//    let name: String
//    let displayName: LocalizedStringResource
//    let oldestYear: Int
//    
//    init(name: String, displayName: LocalizedStringResource, oldestYear: Int) {
//        self.name = name
//        self.displayName = displayName
//        self.oldestYear = oldestYear
//    }
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(ObjectIdentifier(self))
//    }
//    
//    static func ==(lhs: Country, rhs: Country) -> Bool {
//        lhs.name == rhs.name
//    }
//}
