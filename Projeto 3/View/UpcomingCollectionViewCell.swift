//
//  UpcomingCollectionViewCell.swift
//  Projeto 3
//
//  Created by Mariane Vilarim on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup (title: String, year: String, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = year
        self.image.image = image
        //Self.image: É a da classe; .image : É a propriedade da UIImageView = image: É o parametro (input da função) da função.
    }
}
    
