//
//  MenuBarView.swift
//  In This Economy?
//
//  Created by Jan Schmidt on 27.10.26.
//

import SwiftUI

struct MenuBarView: View {
    @State private var showingAdjustmentView = true
    
    var body: some View {
        if showingAdjustmentView {
            MenuBarCalculatorView(viewModel: InflationCalculatorViewModel(), showingAdjustmentView: $showingAdjustmentView)
        } else {
           MenuBarCalculatorView(viewModel: RateViewModel(), showingAdjustmentView: $showingAdjustmentView)
        }
    }
}

#Preview {
    MenuBarView()
}
