//
//  HomeView.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MoviesView(dataType: .comingSoon)
            }
            .tabItem {
                Label("Coming Soon", systemImage: "star")
            }
            
            NavigationStack {
                MoviesView(dataType: .onStreaming)
            }
            .tabItem {
                Label("On Streaming", systemImage: "play.circle")
            }
            
            NavigationStack {
                MoviesView(dataType: .newInCinemas)
            }
            .tabItem {
                Label("New In Cinemas", systemImage: "popcorn.fill")
            }
            
            NavigationStack {
                MoviesView(dataType: .latestOnNetflix)
            }
            .tabItem {
                Label("Latest on Netflix", systemImage: "movieclapper")
            }
        }
    }
}
