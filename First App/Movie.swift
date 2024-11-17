
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
    
//    Removed the variables from the easy and medium challenge
    
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


