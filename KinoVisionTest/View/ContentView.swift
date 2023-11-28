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
        }
    }
}

#Preview {
    ContentView()
}
