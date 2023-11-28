//
//  ForYouView.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import SwiftUI

struct MoviesView: View {
    @State private var viewModel = MoviesViewModel()
    var columns: [GridItem] = [.init(.adaptive(minimum: 300), spacing: 20)]
    var dataType: DataType
    
    init(dataType: DataType) {
        self.dataType = dataType
    }
    
    var body: some View {
        ScrollView {
            VStack {
                movieGrid()
                    .padding()
            }
            .onAppear {
                Task {
                    await viewModel.getMovies(for: dataType)
                }
            }
        }
        .navigationTitle(dataType.rawValue)
    }
}

private extension MoviesView {
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
                            .cornerRadius(9)
                            .shadow(radius: 14)
                            .frame(width: 200, height: 250, alignment: .center)
                    }
                    Text(movie.title)
                        .lineLimit(1)
                }
                .padding()
            }
        })
    }
}
