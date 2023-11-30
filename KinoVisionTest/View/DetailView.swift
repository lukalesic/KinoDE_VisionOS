//
//  DetailView.swift
//  KinoVisionTest
//
//  Created by Dominik Ilijević on 28.11.2023..
//

import SwiftUI

struct DetailView: View {

    let repo = MoviesRepository()
    var viewModel: MovieDetailsViewModel

    var body: some View {
        GeometryReader { reader in
            HStack {
                AsyncImage(url: URL(string: viewModel.selectedMovie.posterURL)) { phase in
                    phase.image?
                        .cornerRadius(10)
                        .shadow(radius: 15)
                }
                    .padding(.leading, 50)

                VStack(alignment: .leading, spacing: 20) {
                    Text(viewModel.selectedMovie.title)
                        .font(.system(size: 54))
                    Text(viewModel.selectedMovie.genre.first ?? "Drama")
                        .font(.system(size: 48))
                        .foregroundStyle(Color.init(white: 0.8))
                    Text(viewModel.selectedMovie.summary ?? "no summary")
                    Spacer()
                    NavigationLink {
                        VideoPlayerView()
                    } label: {
                        Text("Play")
                    }
                    Spacer()
                }
                .onAppear {
                    viewModel.getIndividualDetails()
                }
                .padding(.top, 44)
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
    }
}
