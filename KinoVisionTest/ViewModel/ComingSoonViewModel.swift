//
//  ComingSoonViewModel.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import Foundation
import Observation

@Observable
class ComingSoonViewModel {
    var movies: [Movie] = []
    let repo = ComingSoonRepository()
    
    func getMovies() async {
        Task {
            do {
               let data = try await repo.fetchData()
                self.movies = data.results
            } catch {
                print("error")
            }
           // self.movies = data?.results
        }
    }

}
