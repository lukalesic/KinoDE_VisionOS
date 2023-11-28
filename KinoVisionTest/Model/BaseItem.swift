//
//  BaseItem.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 28.11.2023..
//

import Foundation

struct BaseItem: Codable {
    let next, type, title, posterSize: String
    let subtitleType: String
    let categoryOrder: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case next, type, title
        case posterSize = "poster_size"
        case subtitleType = "subtitle_type"
        case categoryOrder = "category_order"
        case results
    }
}

struct Result: Codable {
    let path: String
    let itemType: ItemType
    let id: Int
    let originalTitle, title: String
    let genre: [String]
    let pgRating: Int?
    let posterURL, photoURL: String
    let stats: Stats
    let ratings: Ratings

    enum CodingKeys: String, CodingKey {
        case path
        case itemType = "item_type"
        case id
        case originalTitle = "original_title"
        case title, genre
        case pgRating = "pg_rating"
        case posterURL = "poster_url"
        case photoURL = "photo_url"
        case stats, ratings
    }
}

enum ItemType: String, Codable {
    case movie = "movie"
}

struct Ratings: Codable {
    let popularity: Double
    let imdbID, imdbRating: String?
    let watchlistCount, starsCount: Int?
    let starsAverage: Int?

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

