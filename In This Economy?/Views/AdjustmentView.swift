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
import InflationKit
import SwiftUI

struct AdjustmentView: View {
    @State private var viewModel = ViewModel()
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    TextField("Enter amount", value: $viewModel.originalAmount, format: .number.decimalSeparator(strategy: .automatic))
                        .onSubmit(viewModel.getPrice)
                    
                    Picker("Pick a country", selection: $viewModel.country) {
                        ForEach(Country.allCases, id: \.self) {
                            Text($0.displayName)
                        }
                    }
                    
                    DatePicker("Choose a start date", selection: $viewModel.startDate, in: viewModel.country.oldestDate..., displayedComponents: .date)
                    
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
                            .font(.system(size: 45)).bold()
                            .textSelection(.enabled)
                            
                    }
                }
                .frame(width: 275, height: 200)
                .background(.regularMaterial, in: .rect(cornerRadius: 20))
                .overlay(alignment: .topTrailing) {
                    Button(action: viewModel.copyToClipboard) {
                        Image(systemName: "rectangle.portrait.on.rectangle.portrait")
                            .font(.system(size: 14))
                            .offset(x: -5, y: 5)
                    }
                    .buttonStyle(.plain)
                    .help("Copy")
                    .disabled(viewModel.calculatedAmount.isEmpty)
                }
            }
            
            Text("Inflation data provided by www.statbureau.org")
                .font(.callout)
        }
        .padding()
        .navigationTitle("Adjust for inflation")
        .focusedSceneValue(viewModel)
    }
}

#Preview {
    AdjustmentView()
}

