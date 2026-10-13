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

struct CalculatorView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    if #available(macOS 27.0, *) {
                        TextField("Enter original amount", text: $viewModel.originalAmount)
                    }
                    
                    Picker("Pick a country", selection: $viewModel.country) {
                        ForEach(Country.allCases, id: \.self) {
                            Text($0.displayName)
                        }
                    }
                    
                    DatePicker("Choose a start date", selection: $viewModel.startDate, in: Date(timeIntervalSince1970: -1_796_083_200)..., displayedComponents: .date)
                    
                    DatePicker("Choose an end date", selection: $viewModel.endDate, displayedComponents: .date)
                    
                    Button("Calculate", action: viewModel.getPrice)
                        .buttonStyle(.borderedProminent)
                }
                .padding()
                .frame(width: 275, height: 200)
                .background(.regularMaterial, in: .rect(cornerRadius: 20))
                
                Group {
                    if viewModel.calculatedAmount.isEmpty {
                        ContentUnavailableView("Nothing calculated yet", systemImage: "nosign", description: Text("Choose a starting amount, a country and start & end dates and click on \"calculate\"."))
                    } else {
                        Text(viewModel.calculatedAmount)
                            .font(.system(size: 50)).bold()
                    }
                }
                .frame(width: 275, height: 200)
                .background(.regularMaterial, in: .rect(cornerRadius: 20))
            }
            
            Text("Inflation data provided by www.statbureau.org")
                .font(.callout)
        }
        .padding()
        .navigationTitle("Adjust for inflation")
    }
}

#Preview {
    CalculatorView()
}

//VStack(alignment: .leading) {
//    Picker("Pick a country", selection: $viewModel.country) {
//        ForEach(viewModel.inflationCalculator.countryList, id: \.self) {
//            Text($0.displayName)
//        }
//    }
//    
//    DatePicker("Choose a start date", selection: $viewModel.startDate, displayedComponents: .date)
//    
//    DatePicker("Choose an end date", selection: $viewModel.endDate, displayedComponents: .date)
//    
//    TextField("Enter original amount", text: $viewModel.originalAmount)
//    
//    Button("Click me", action: viewModel.getPrice)
//        .buttonStyle(.borderedProminent)
//    
//    Text(viewModel.calculatedAmount)
//    
//    Text("Inflation data provided by www.statbureau.org")
//        .padding(.top)
//}
//.navigationTitle("Inflation Calculator")
//.padding(.horizontal)
