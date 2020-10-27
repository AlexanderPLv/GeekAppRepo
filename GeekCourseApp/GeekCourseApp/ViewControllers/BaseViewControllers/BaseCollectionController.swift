//
//  BaseCollectionController.swift
//  GeekCourseApp
//
//  Created by MacMini on 22.10.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    public init() {
            super.init(collectionViewLayout: UICollectionViewFlowLayout())
        }
        
        required public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}

