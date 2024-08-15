//
//  DatingCalculatorView.swift
//  DatingCalculator
//
//  Created by ZakTan on 8/14/24.
//

import SwiftUI

struct DatingCalculatorView: View {
    @StateObject private var viewModel = DatingCalculatorVM()
    
    var body: some View {
        VStack {
            // Display the zone image centered and resizable
            if let zone = viewModel.zone {
                Image(uiImage: zone.image ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
            } else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
            }
            
            // Sliders for Hotness and Craziness
            VStack {
                VStack {
                    Text("Hotness: \(Int(viewModel.hotness))")
                    Slider(value: $viewModel.hotness, in: 1...10, step: 1)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
                
                VStack {
                    Text("Craziness: \(Int(viewModel.craziness))")
                    Slider(value: $viewModel.craziness, in: 1...10, step: 1)
                        .padding(.horizontal)
                }
            }
            .padding(.bottom, 20)
            
            // Button to calculate the zone
            Button(action: {
                viewModel.determineZone()
            }) {
                Text("Calculate Zone")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    DatingCalculatorView()
}
