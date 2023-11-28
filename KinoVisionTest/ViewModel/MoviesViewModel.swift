//
//  ComingSoonViewModel.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import Foundation
import Observation

@Observable
class MoviesViewModel {
    var movies: [Movie] = []
    let repo = MoviesRepository()

    func getMovies(for type: DataType) async {
        Task {
            do {
                let data = try await repo.fetchData(for: type)
                self.movies = data.results
            } catch {
                print("error")
            }
        }
    }

}
