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
            ForYouView()
                .tabItem {
                    Label("For you", systemImage: "star")
                }
            WhatToWatchView()
                .tabItem {
                    Label("What to watch", systemImage: "play.circle")
                }
        }    }
}

#Preview {
    ContentView()
}
