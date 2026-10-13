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

import SwiftUI

struct AboutView: View {
    private var appVersionAndBuild: String {
            let version = Bundle.main
                .infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
            return "Version \(version)"
        }
    
    private var copyright: String {
            let year = Calendar.current.component(.year, from: Date())
            return "Copyright © \(year) Jan Frédéric Schmidt"
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Image(systemName: "info.circle")
                .font(.system(size: 50))
                .fontWeight(.heavy)
            VStack(alignment: .leading) {
                Text("In This Economy?")
                    .font(.largeTitle).bold()
                Text(appVersionAndBuild)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            ScrollView {
                Text("""
                 This program is an inflation calculator used to adjust prices for inflation
                 
                 \(copyright)
                 
                 This program is free software; you can redistribute it and/or modify
                 it under the terms of the GNU General Public License as published by
                 the Free Software Foundation; either version 2 of the License, or
                 (at your option) any later version.
                 
                 This program is distributed in the hope that it will be useful,
                 but WITHOUT ANY WARRANTY; without even the implied warranty of
                 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                 GNU General Public License for more details.
                 
                 You should have received a copy of the GNU General Public License along
                 with this program; if not, write to the Free Software Foundation, Inc.,
                 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
                 """)
                .font(.callout)
                .padding(5)
            }
            .frame(maxWidth: 300, maxHeight: 150)
            .background(.background, in: .rect(cornerRadius: 5))
            
            Link("Jan Frédéric Schmidt on GitHub", destination: URL(string: "https://github.com/Jan-Frederic-Schmidt")!)
                .font(.callout)
        }
        .padding()
        .navigationTitle("About")
    }
}

#Preview {
    AboutView()
}
