//
//  ComingSoonViewModel.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import Foundation
import Observation

enum DataState {
    case empty
    case loading
    case loaded
}

@Observable
class MoviesViewModel {
    var movies: [Movie] = []
    let repo = MoviesRepository()
    var categories: [Category] = []
    var dataState = DataState.loading
        
    func getAllCategories() async {
        self.dataState = .loading
        if self.categories.isEmpty, let allData = try? await repo.fetchAllData() {
            self.categories = allData
            self.dataState = .loaded
        }
    }
    
    func filterCategory(for type: DataType) async {
        if let chosenCategory = self.categories.first(where: {$0.title == type.rawValue}) {
            self.dataState = .loading
            self.movies = chosenCategory.results
            self.dataState = .loaded
        }
    }

    func getMovies(for type: DataType) async {
        Task {
            do {
                let data = try await repo.fetchCategory(for: type)
                self.movies = data.results
            } catch {
                print("error")
            }
        }
    }
}
