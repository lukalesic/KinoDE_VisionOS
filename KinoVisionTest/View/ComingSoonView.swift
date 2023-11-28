//
//  ForYouView.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import SwiftUI

struct ComingSoonView: View {
    @State private var viewModel = ComingSoonViewModel()
    var columns: [GridItem] = [.init(.adaptive(minimum: 200), spacing: 20)]
    
    var body: some View {
        ScrollView {
            VStack {
                movieGrid()
                    .padding()
            }
            .onAppear {
                Task {
                    await viewModel.getMovies()
                }
            }
        }
    }
}

private extension ComingSoonView {
    @ViewBuilder
    func movieGrid() -> some View {
        LazyVGrid(columns: columns, content: {
            ForEach(viewModel.movies, id: \.title) { movie in
                VStack {
                    AsyncImage(url: URL(string: movie.posterURL)) { phase in
                        phase
                            .image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 200, alignment: .center)
                    }
                    Text(movie.title)
                }
            }
        })
    }
}
