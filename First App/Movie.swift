//
//  Movie.swift
//  First App
//
//  Created by Pranav Bobde on 08/11/22.
//

import Foundation

struct Movie: Codable {
    var budget: Int?
    var genres: [String]?
    var homepage: String?
    var id: Int?
    var original_language: String?
    var overview: String?
    var popularity: Double?
    var poster_path : String?
    var release_date: String?
    var revenue: Int?
    var runtime: Int?
    var tagline: String?
    var title: String?
    var vote_average: Float?
    var vote_count: Int?
    var external_ids: allIds?
    var similar: [similarItem]?
    var certification: String?
    var directors: [people]?
    var writers: [people]?
    var cast: [people]?
    var trailer_yt: String?
    
    
    
    static let allMovies: [Movie] = Bundle.main.decode(file: "tmbdMovies.json")
    static let samplePerson: Movie =  allMovies[0]
}

struct allIds: Codable {
    var imdb_id: String?
    var facebook_id: String?
    var instagram_id: String?
    var twitter_id: String?
}

struct similarItem: Codable {
    var id: Int?
    var title: String?
}

struct people: Codable {
    var id: Int?
    var name: String?
}



extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError()
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else{
            fatalError()
        }
        
        return loadedData
    }
}
