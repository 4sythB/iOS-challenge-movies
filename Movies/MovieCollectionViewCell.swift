//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Brad on 7/22/16.
//  Copyright © 2016 Brad Forsyth. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func updateWithMovie(movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.rating)"
        
        ImageController.imageForURL(movie.poster) { (image) in
            guard let image = image else { return }
            self.posterImageView.image = image
        }
    }
}
