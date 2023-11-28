//
//  HomeView.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import SwiftUI

struct ContentView: View {
        @State private var viewModel = MoviesViewModel()
    var body: some View {
        TabView {
            NavigationStack {
                MoviesView(dataType: .comingSoon)
                    .environment(viewModel)
            }
            .tabItem {
                Label("Coming Soon", systemImage: "star")
            }
            
            NavigationStack {
                MoviesView(dataType: .onStreaming)
                    .environment(viewModel)
            }
            .tabItem {
                Label("On Streaming", systemImage: "play.circle")
            }
            
            NavigationStack {
                MoviesView(dataType: .newInCinemas)
                    .environment(viewModel)
            }
            .tabItem {
                Label("New In Cinemas", systemImage: "popcorn.fill")
            }
            
            NavigationStack {
                MoviesView(dataType: .latestOnNetflix)
                    .environment(viewModel)
            }
            .tabItem {
                Label("Latest on Netflix", systemImage: "movieclapper")
            }
        }
    }
}
