//
//  SearchViewController.swift
//  GeekCourseApp
//
//  Created by MacMini on 06.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let searchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.placeholder = "Enter search text"
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .vkBlue
        
        return sb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupSearchBar()
        
        
    }
    
    private func setupSearchBar() {
        let navBar = navigationController?.navigationBar
        searchBar.anchor(top: navBar?.topAnchor, left: navBar?.leftAnchor, bottom: navBar?.bottomAnchor, right: navBar?.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    }

    

    // MARK: UICollectionViewDataSource
    
    fileprivate func configureCollectionView() {
        self.collectionView!.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.reuseIdentifier)
        navigationController?.navigationBar.addSubview(searchBar)
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.reuseIdentifier, for: indexPath) as? SearchCell else { fatalError() }
      

    

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}
