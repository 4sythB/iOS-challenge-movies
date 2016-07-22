//
//  Movie.swift
//  Movies
//
//  Created by Brad on 7/22/16.
//  Copyright © 2016 Brad Forsyth. All rights reserved.
//

import Foundation

class Movie {
    
    private let kTitle = "title"
    private let kPopularity = "popularity"
    private let kOverview = "overview"
    private let kPoster = "poster_path"
    
    var title: String
    var popularity: String
    var overview: String
    var poster: String
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary[kTitle] as? String, popularity = dictionary[kPopularity] as? String, overview = dictionary[kOverview] as? String, poster = dictionary[kPoster] as? String else { return nil }
        
        self.title = title
        self.popularity = popularity
        self.overview = overview
        
        let imageBaseURL = NSURL(string: "http://image.tmdb.org/t/p/w500")
        let imageURL = imageBaseURL?.URLByAppendingPathComponent(poster)
        
        self.poster = String(imageURL)
        
        ImageController.imageForURL(self.poster) { (image) in
            // TODO: - figure out image url
        }
    }
}