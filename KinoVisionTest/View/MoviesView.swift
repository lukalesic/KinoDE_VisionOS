//
//  ForYouView.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import SwiftUI

struct MoviesView: View {
    @Environment(MoviesViewModel.self) private var viewModel: MoviesViewModel
    @Environment(\.openWindow) private var openWindow
    var columns: [GridItem] = [.init(.adaptive(minimum: 300), spacing: 20)]
    var dataType: DataType
    
    init(dataType: DataType) {
        self.dataType = dataType
    }
    
    var body: some View {
        ZStack {
            Color.clear
                .onLoad {
                    Task {
                        await viewModel.getAllCategories()
                        await viewModel.filterCategory(for: dataType)
                    }
                }
                .onAppear {
                    Task {
                        await viewModel.filterCategory(for: dataType)
                    }
                }
            
            switch viewModel.dataState {
            case .loading:
                Text("Loading")
                
            case .loaded:
                ScrollView {
                    VStack {
                        movieGrid()
                            .padding()
                            .navigationTitle(dataType.rawValue)
                    }
                }
            default:
                ProgressView()
            }
        }
    }
}

private extension MoviesView {
    @ViewBuilder
    func movieGrid() -> some View {
        LazyVGrid(columns: columns, content: {
            ForEach(viewModel.movies, id: \.title) { movie in
                NavigationLink(destination: DetailView(viewModel: MovieDetailsViewModel(selectedMovie: movie))) {
                    VStack {
                        AsyncImage(url: URL(string: movie.posterURL)) { phase in
                            phase
                                .image?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 250, alignment: .center)
                        }
                        Text(movie.title)
                            .lineLimit(1)
                    }
                }
                .buttonStyle(.plain)
                .padding()
            }
        })
    }
}
