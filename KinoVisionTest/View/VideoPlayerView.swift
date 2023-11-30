//
//  VideoPlayerView.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 29.11.2023..
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")
    var body: some View {
        VStack {
            VideoPlayer(player: AVPlayer(url: url!))
        }
    }
}

