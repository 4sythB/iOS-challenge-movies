//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Brad on 7/22/16.
//  Copyright © 2016 Brad Forsyth. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateWithMovie(movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.rating)"
        overviewLabel.text = movie.overview
        
        ImageController.imageForURL(movie.poster) { (image) in
            guard let image = image else { return }
            self.posterImageView.image = image
        }
    }
}
