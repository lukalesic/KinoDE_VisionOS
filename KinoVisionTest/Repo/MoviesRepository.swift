//
//  ComingSoonRepository.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import Foundation

enum NetworkError: String, Error {
    case notAvailable = "Content not available"
}

enum DataType: String, CaseIterable {
    case comingSoon = "Coming soon"
    case onStreaming = "Movies on Streaming"
    case newInCinemas = "New in Cinemas"
    case latestOnNetflix = "TV shows on Streaming"
    
    var link: String {
        switch self {
        case .comingSoon:
            return MoviesRepository.comingSoonLink
        case .onStreaming:
            return MoviesRepository.onStreamingLink
        case .newInCinemas:
            return MoviesRepository.newInCinemasLink
        case .latestOnNetflix:
            return MoviesRepository.latestOnNetflixLink
        }
    }
}

@Observable
class MoviesRepository: Repository {
    
    static let comingSoonLink = "http://kino-api.smbapps.cf/api/coming_soon/"
    static let onStreamingLink = "http://kino-api.smbapps.cf/api/streaming/movies/?&sort_by=newest"
    static let newInCinemasLink = "https://kino-api.smbapps.cf/api/cinemas/?&latitude=51.3202&longitude=9.49362&radius=1.0&sort_by=newest"
    static let latestOnNetflixLink = "http://kino-api.smbapps.cf/api/streaming/tvshows/?&sort_by=newest&services=1"

    init() {
    }
    
    func fetchAllData() async throws -> [Category] {
        let taskCategories = try await withThrowingTaskGroup(
            of: Category.self,
            returning: [Category]?.self
        ) { taskGroup in
            
            for category in DataType.allCases {
                taskGroup.addTask {
                    try await self.fetchCategory(for: category)
                }
            }
            let categories = try await taskGroup.reduce(into: [Category]()) { partialResult, response in
                          partialResult.append(response)
                      }
            return categories
        }
        return taskCategories!
    }
    
    func fetchCategory(for type: DataType) async throws -> Category {
        guard let url = URL(string: type.link) else {
            throw fatalError()
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                guard let data = data, error == nil, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Category.self, from: data)
                    continuation.resume(returning: result)
                } catch {
                    print(error)
                    continuation.resume(throwing: NetworkError.notAvailable)
                }
            }
            task.resume()
        }
    }
}
