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
            return upcomingMovies.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else {
            return makeUpcomingCell(indexPath)
        }
            
        //
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell =
            popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell {
            //Reaproveitamento da celula e mudança para popular Collection View
            
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage())
            
            let movie = popularMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: imagem)
            }
            
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            
            let movie = nowPlayingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, year: String(movie.releaseDate.prefix(4)), image: imagem)
            }
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
            //Constante usado para reutilizar celulas e não ocupar tanto espaço no app
            let titulo: String = upcomingMovies[indexPath.item].title
            //Constante do título em string que chama os títulos dos filmes do upcoming e o indexPath.item serve para acessar cada título
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date: Date? = dateFormatter.date(from: upcomingMovies[indexPath.item].releaseDate)
            // Constante para ter acesso a data no formato disponibilizado pelo sistema
    
            dateFormatter.dateFormat = "MMM dd"
            let dataBonita = dateFormatter.string(from: date ?? Date())
            // Transformando a data para um formato escolhido
            
            cell.setup (title: titulo, year: dataBonita,
                       image: UIImage(named: upcomingMovies[indexPath.item].posterPath) ?? UIImage())
            
            //Comentário Geral: Parametros para ter acesso ao título do filme, data do filme e ao poster
            
            let movie = upcomingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, year: String(movie.releaseDate.prefix(4)), image: imagem)
            }
            
            return cell
        }
        return UpcomingCollectionViewCell()
    }
}

