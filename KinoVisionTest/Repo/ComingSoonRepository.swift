//
//  ComingSoonRepository.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import Foundation

@Observable
class ComingSoonRepository: Repository {
    
    static let comingSoonLink = "http://kino-api.smbapps.cf/api/coming_soon/"
    
    init() {
        
    }
    
    func fetchData() async throws -> Category {
        guard let url = URL(string: Self.comingSoonLink) else {
            throw fatalError()
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response , error in
                guard let data = data, error == nil, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Category.self, from: data)
                    continuation.resume(returning: result)
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
}
