//
//  Movie.swift
//  KinoVisionTest
//
//  Created by Luka Lešić on 29.11.2023..
//

import Foundation

struct Movie: Codable, Hashable {
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id && lhs.itemType == rhs.itemType
    }
    
    let path: String?
    let itemType: ItemType
    let id: Int
    let originalTitle, title: String
    let genre: [String]
    let pgRating: Int?
    let posterURL, photoURL: String
    let stats: Stats
    let ratings: Ratings
    
    //extending struct to support individual Movies
    var summary: String?
    var people: [Person]?
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case itemType = "item_type"
        case id
        case originalTitle = "original_title"
        case title, genre
        case pgRating = "pg_rating"
        case posterURL = "poster_url"
        case photoURL = "photo_url"
        case stats, ratings
        case summary, people
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(itemType)
        hasher.combine(title)
        hasher.combine(photoURL)
        hasher.combine(posterURL)
    }
    
    init(path: String, itemType: ItemType, id: Int, originalTitle: String,
         title: String, genre: [String], pgRating: Int?, posterURL: String,
         photoURL: String, stats: Stats, ratings: Ratings, summary: String? = nil,
         people: [Person]? = nil) {
        self.path = path
        self.itemType = itemType
        self.id = id
        self.originalTitle = originalTitle
        self.title = title
        self.genre = genre
        self.pgRating = pgRating
        self.posterURL = posterURL
        self.photoURL = photoURL
        self.stats = stats
        self.ratings = ratings
        self.summary = summary
        self.people = people
    }
}
