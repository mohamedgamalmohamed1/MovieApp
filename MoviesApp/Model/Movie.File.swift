//
//  Movie.File.swift
//  MoviesApp
//
//  Created by mohamed gamal mohamed on 5/31/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import Foundation


struct SearchResults: Codable{
    
    var Search: [Movie]?
    var totalResults: String?
    var Response: String?
}

struct Movie: Codable {
    var Title: String?
    var Year: String?
    var imdbID: String?
    var Poster: String?
}
