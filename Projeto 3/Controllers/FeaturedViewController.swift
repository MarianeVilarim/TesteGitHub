//
//  FeaturedViewController.swift
//  Projeto 3
//
//  Created by Mariane Vilarim on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: <#T##IndexPath#>) as? PopularCollectionViewCell
        //Reaproveitamento da celula e mudança para popular Collection View
        
        cell?.titleLabel.text = "Titulo do Filme"
        //celula do titulo do filme
        
        cell?.image.image = UIImage()
        //celula da imagem
        
        return cell ?? UICollectionViewCell()
        //se não tiver resposta, traga a celula da UICollectionView
    }
    

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
    }


}

