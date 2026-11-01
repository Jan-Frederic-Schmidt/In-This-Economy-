//
//  MenuBarAdjustmentCalculator.swift
//  In This Economy?
//
//  Created by Jan Schmidt on 27.10.26.
//

import Foundation
import InflationKit
import SwiftUI

struct MenuBarCalculatorView: View {
    @State var viewModel: InflationCalculatorViewModel
    @Binding var showingAdjustmentView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: viewModel.copyToClipboard) {
                    Label(viewModel.result ?? "No value yet", systemImage: "rectangle.portrait.on.rectangle.portrait")
                        .font(.title2.bold())
                }
                .buttonStyle(.plain)
                .disabled(viewModel.result != nil)
                
                Spacer()
            }
            .overlay(alignment: showingAdjustmentView ? .trailing : .leading) {
                Button("Switch to inflation rate calculator", systemImage: showingAdjustmentView ? "arrow.right.circle.fill" : "arrow.left.circle.fill") {
                    withAnimation {
                        showingAdjustmentView.toggle()
                    }
                }
                .buttonStyle(.plain)
                .labelStyle(.iconOnly)
                .padding(.horizontal)
            }
            
            Divider()
            
            if type(of: viewModel) != RateViewModel.self {
                TextField("Enter a start value", value: $viewModel.amount, format: .number.decimalSeparator(strategy: .automatic))
                    .frame(width: 145)
            }
            
            Picker("Choose a country", selection: $viewModel.country) {
                ForEach(Country.allCases, id: \.self) {
                    Text($0.displayName)
                }
            }
            .labelsHidden()
            
            DatePicker("Start:", selection: $viewModel.startDate, in: viewModel.country.oldestDate..., displayedComponents: .date)
            
            DatePicker("End:", selection: $viewModel.endDate, in: viewModel.country.oldestDate..., displayedComponents: .date)
            
            Button("Calculate", action: viewModel.calculate)
        }
        .frame(width: 200)
        .padding(.vertical)
        .overlay(alignment: .topTrailing) {
            
        }
    }
}
