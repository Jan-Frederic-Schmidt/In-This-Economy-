// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
// If a copy of the MPL was not distributed with this file,
// You can obtain one at https://mozilla.org/MPL/2.0/.
// Copyright © 2026 Jan Frédéric Schmidt

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker("Pick a country", selection: $viewModel.country) {
                ForEach(viewModel.inflationCalculator.countryList, id: \.self) {
                    Text($0.displayName)
                }
            }
            
            DatePicker("Choose a start date", selection: $viewModel.startDate, displayedComponents: .date)
            
            DatePicker("Choose an end date", selection: $viewModel.endDate, displayedComponents: .date)
            
            TextField("Enter original amount", text: $viewModel.originalAmount)
            
            Button("Click me", action: viewModel.getPrice)
                .buttonStyle(.borderedProminent)
            
            Text(viewModel.calculatedAmount)
            
            Text("Inflation data provided by www.statbureau.org")
                .padding(.top)
            Text("Copyright © 2026 Jan Frédéric Schmidt")
        }
        .navigationTitle("Inflation Calculator")
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
