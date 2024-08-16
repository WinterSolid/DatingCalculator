//
//  DatingCalculatorView.swift
//  DatingCalculator
//
//  Created by ZakTan on 8/14/24.
//
import SwiftUI
import AVKit

struct DatingCalculatorView: View {
    @StateObject private var viewModel = DatingCalculatorVM()
    @State private var player: AVPlayer? = nil
    
    var body: some View {
        VStack {
            // Video Player
            if let videoFileName = viewModel.videoFileName, let url = Bundle.main.url(forResource: videoFileName, withExtension: "mp4") {
                VideoPlayer(player: player)
                    .frame(height: 300)
                    .onAppear {
                        // Initialize player and start playing when the view appears
                        player = AVPlayer(url: url)
                        player?.play()
                    }
                    .onChange(of: viewModel.videoFileName) { newFileName in
                        // Update player and automatically play the new video when the videoFileName changes
                        if let newUrl = Bundle.main.url(forResource: newFileName, withExtension: "mp4") {
                            player = AVPlayer(url: newUrl)
                            player?.play() // Automatically start playing
                        }
                    }
            } else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
            }
            
            // Display Zone Description
            Text(viewModel.description?.uppercased() ?? "UNDEFINED ZONE")
                .font(.largeTitle)
                .padding(.top, 20)
                .padding(.bottom, 30)
            
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
            
            HStack {
                // Gender Toggle Button
                Button(action: {
                    viewModel.gender = (viewModel.gender == .female) ? .male : .female
                }) {
                    HStack {
                        Image(systemName: viewModel.gender == .female ? "person.circle.fill" : "person.circle")
                        Text(viewModel.gender == .female ? "Female" : "Male")
                    }
                    .padding()
                    .background(viewModel.gender == .female ? Color.pink : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                // Button to calculate the zone
                Button(action: {
                    viewModel.determineZone()
                }) {
                    Text("Calculate Zone")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

#Preview {
    DatingCalculatorView()
}
