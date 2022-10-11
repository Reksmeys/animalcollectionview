//
//  ViewController.swift
//  FlexibleLayoutDemo
//
//  Created by រស្មី on 11/10/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    

    @IBOutlet weak var animalGallery: UICollectionView!
    
    
    let animalArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        animalGallery.dataSource = self
        animalGallery.collectionViewLayout = createLayout2()
    }
    
    
    
    func createLayout() -> UICollectionViewCompositionalLayout{
        
        // item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)

        // group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitem: item, count: 2)
        
        // section
        
        let section = NSCollectionLayoutSection(group: group)
        
        // return layout
        return UICollectionViewCompositionalLayout(section: section)
  
    }
    
    func createLayout2() -> UICollectionViewCompositionalLayout{
        // item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        verticalItem.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)), subitem: verticalItem, count: 2)
        
        // horizontal( item, vertical )
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [verticalGroup, item])
        
//        let section = NSCollectionLayoutSection(group: horizontalGroup)
        
//        section.orthogonalScrollingBehavior = .continuous
        
        // main item
        let mainItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        
        let mainGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500)), subitems: [mainItem, horizontalGroup])
        
        let section = NSCollectionLayoutSection(group: mainGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath) as! AnimalCell
        
        cell.itemImageView.image = UIImage(named: animalArr[indexPath.row])
        
        return cell
        
    }


}





