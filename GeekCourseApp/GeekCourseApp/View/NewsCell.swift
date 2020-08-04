//
//  NewsCell.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    
    
    let userPhoto: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let newsImage: UIImageView = {
       let iv = UIImageView()
        return iv
    }()
    
    var data: User? {
        didSet {
            setupUserImage()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        sizeToFit()
        addSubview(userPhoto)
        addSubview(userNameLabel)
        addSubview(newsImage)
        setupLayout()
        
        
        setupUserImage()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUserImage() {
        guard let data = data else { return }
        userPhoto.image = UIImage(named: data.image)
        userNameLabel.text = data.firstName
        newsImage.image = UIImage(named: data.image)
    }
    
    func setupLayout() {
        userPhoto.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: nil,
                         paddingTop: 8, paddingLeft: 16, paddingBottom: 8, paddingRight: 0,
                         width: 80, height: 80)
        userPhoto.layer.cornerRadius = 80 / 2
        userPhoto.clipsToBounds = true
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.centerYAnchor.constraint(equalTo: userPhoto.centerYAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 16).isActive = true
        
        newsImage.anchor(top: userPhoto.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
    
}

extension NewsCell: ReusableView {}
