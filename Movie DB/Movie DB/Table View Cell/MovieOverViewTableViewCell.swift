//
//  MovieOverViewTableViewCell.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/12/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import UIKit
import SDWebImage

class MovieOverViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(movie: Movie) {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        ratingLabel.text = "\(movie.voteAverage) / 10"
        let posterUrl = getMoviePosterUrl(posterPath: movie.posterPath, backdropPath: movie.backdropPath)
        posterImage.sd_setImage(with: URL(string: posterUrl.posterUrl),
                                            placeholderImage: UIImage(named: "moviePlaceHolderImage"))
    }
}

extension MovieOverViewTableViewCell {
    fileprivate func getMoviePosterUrl(posterPath: String, backdropPath: String) -> (posterUrl: String, backdropUrl: String) {
        
        return ("\(Url.baseImageUrl)\(posterPath)","\(Url.baseImageUrl)\(backdropPath)")
    }
    
}
