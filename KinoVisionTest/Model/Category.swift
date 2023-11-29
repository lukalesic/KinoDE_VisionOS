//
//  BaseItem.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import Foundation

struct Category: Codable {
    let next, type, title, posterSize: String
    let subtitleType: String
    let categoryOrder: Int?
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case next, type, title
        case posterSize = "poster_size"
        case subtitleType = "subtitle_type"
        case categoryOrder = "category_order"
        case results
    }
}

struct Person: Codable {
    let id: Int
    let name: String
    let role: PersonRole
    let photoUrl: String?
    let order: Int?
    let characterName: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, role, order
        case photoUrl = "photo_url"
        case characterName = "character_name"
    }
}

enum PersonRole: String, Codable {
    case actorPerson = "actor"
    case writer = "writer"
    case producer = "producer"
    case director = "director"
    case creator = "creator"
    
    var stringValue: String {
        return self.rawValue.capitalized
    }
}



enum ItemType: String, Codable {
    case movie = "movie"
    case tvShow = "tvshow"
}

struct Ratings: Codable {
    let popularity: Double
    let imdbID, imdbRating: String?
    let watchlistCount, starsCount: Int?
    let starsAverage: String?
    
    enum CodingKeys: String, CodingKey {
        case popularity
        case imdbID = "imdb_id"
        case imdbRating = "imdb_rating"
        case watchlistCount = "watchlist_count"
        case starsCount = "stars_count"
        case starsAverage = "stars_average"
    }
}

struct Stats: Codable {
    let premiereDate: String
    
    enum CodingKeys: String, CodingKey {
        case premiereDate = "premiere_date"
    }
}

