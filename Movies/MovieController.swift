//
//  MovieController.swift
//  Movies
//
//  Created by Brad on 7/22/16.
//  Copyright © 2016 Brad Forsyth. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = NSURL(string: "http://api.themoviedb.org/3/search/movie")
    static private let apiKey = "39b3b8ccedabe0c9373ba3b32a814d13"
    
    static func searchMovies(searchTerm: String, completion: (movies: [Movie]?) -> Void) {
        guard let url = baseURL else { return }
        let urlParameters = ["api_key" : apiKey, "query" : searchTerm.lowercaseString, "application" : "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            guard let data = data, responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) else {
                print("Unable to get data. \n\(error?.localizedDescription)")
                completion(movies: nil)
                return
            }
            
            guard let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String : AnyObject] else {
                print("Unable to serialize JSON. \n\(responseDataString)")
                completion(movies: nil)
                return
            }
            
            guard let moviesArray = jsonDictionary["results"] as? [[String : AnyObject]] else { return }
            
            dispatch_async(dispatch_get_main_queue()) {
                let movies = moviesArray.flatMap { Movie(dictionary: $0) }
                completion(movies: movies)
            }
        }
    }
}







