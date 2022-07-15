//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  Projeto 3
//
//  Created by Mariane Vilarim on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if collectionView == popularCollectionView {
            
            movie = popularMovies [indexPath.item]
        } else {
            
            movie = nowPlayingMovies [indexPath.item]
        }
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        //m770255
    }
}