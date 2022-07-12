//
//  FeaturedViewController.swift
//  Projeto 3
//
//  Created by Mariane Vilarim on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    
    

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
            //Reaproveitamento da celula e mudança para popular Collection View
            
            cell.titleLabel.text = popularMovies[indexPath.item].title
            //celula do titulo do filme
            
            cell.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            //celula da imagem
            return cell
            }
        
        return UICollectionViewCell()
        //
        }
    

}

