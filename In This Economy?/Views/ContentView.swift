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
                        
import TipKit
import SwiftUI

struct ContentView: View {
    enum Screens {
        case adjust, rate
    }

    @State private var screen = Screens.adjust
    
    var body: some View {
        Group {
            switch screen {
            case .adjust:
                CalculatorView(viewModel: InflationCalculatorViewModel())
            case .rate:
                CalculatorView(viewModel: RateViewModel())
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Picker("What do you want to do?", selection: $screen) {
                    Label("Adjust for inflation", systemImage: "dollarsign.circle.fill")
                        .tag(Screens.adjust)
                        .help("Adjust any price for inflation")
                    
                    Label("Get the inflation rate", systemImage: "chart.line.uptrend.xyaxis")
                        .tag(Screens.rate)
                        .help("Get the inflation rate for a country and time frame")
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    ContentView()
}
