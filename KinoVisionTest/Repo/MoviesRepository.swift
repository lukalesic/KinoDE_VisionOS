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

enum DataType: String {
    case comingSoon = "Coming Soon"
    case onStreaming = "On Streaming"
    
    var link: String {
        switch self {
        case .comingSoon:
            return MoviesRepository.comingSoonLink
        case .onStreaming:
            return MoviesRepository.onStreamingLink
        }
    }
}

@Observable
class MoviesRepository: Repository {
    
    static let comingSoonLink = "http://kino-api.smbapps.cf/api/coming_soon/"
    static let onStreamingLink = "http://kino-api.smbapps.cf/api/streaming/movies/?&sort_by=newest"

    init() {
        
    }
    
    func fetchData(for type: DataType) async throws -> Category {
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
