//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Projeto 3
//
//  Created by Mariane Vilarim on 12/07/22.
//

import UIKit
extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else {
            return 0
        }
        
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell =
            popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
            //Reaproveitamento da celula e mudança para popular Collection View
            cell.titleLabel.text = popularMovies[indexPath.item].title
            //celula do titulo do filme
            cell.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            //celula da imagem
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as?NowPlayingCollectionViewCell {
            cell.titleLabel.text = nowPlayingMovies[indexPath.item].title
            cell.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        return UICollectionViewCell()
        //
    }
}
    
