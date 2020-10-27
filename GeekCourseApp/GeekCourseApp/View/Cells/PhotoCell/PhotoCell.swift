//
//  PhotoCell.swift
//  GeekCourseApp
//
//  Created by MacMini on 22.10.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell, ReusableView {
    
    let photo: AsyncImageView = {
       let photo = AsyncImageView()
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.backgroundColor = .purple
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(photo)
        photo.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
