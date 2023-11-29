//
//  MovieDetailsViewModel.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 29.11.2023..
//

import Foundation
import Observation

@Observable
class MovieDetailsViewModel {
    var selectedMovie: Movie
    var repo = MoviesRepository()
    
    init(selectedMovie: Movie) {
        self.selectedMovie = selectedMovie
    }
    
    func getIndividualDetails() {
        Task {
            let additionalMovieDetails = try? await repo.fetchIndividualContent(for: .movie, id: selectedMovie.id)
            self.selectedMovie.summary = additionalMovieDetails?.summary
        }
    }
}

