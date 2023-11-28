//
//  ComingSoonRepository.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import Foundation

class ComingSoonRepository: Repository {
    
    static let comingSoonLink = "http://kino-api.smbapps.cf/api/coming_soon/"
    
    func fetchData() {
        guard let url = URL(string: Self.comingSoonLink) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _ , error in
            guard let data = data, error == nil else { print("ERR"); return }
    
            do {
                let result = try JSONDecoder().decode([BaseItem].self, from: data)
                print(result.first)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
