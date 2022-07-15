//
//  DetailsViewConroller.swift
//  Projeto 3
//
//  Created by Mariane Vilarim on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        guard let movie = movie else {
            return
        }
        self.title = movie.title
        Task {
            let imageDataBackdrop = await Movie.downloadImageData(withPath: movie.backdropPath)
            let backdrop = UIImage(data: imageDataBackdrop) ?? UIImage()
            
            self.backdropImage.image = backdrop
           // self.backdropImage.image = image
            
            let imageDataPoster = await Movie.downloadImageData(withPath: movie.posterPath)
            let poster = UIImage(data: imageDataPoster) ?? UIImage()
            
            self.posterImage.image = poster
        }
        
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating:\(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
    }
    

}
