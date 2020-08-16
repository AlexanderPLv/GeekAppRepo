//
//  NewsCell.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell, ReusableView {
    
    let profileImage: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        iv.image = UIImage(named: "vasa")
        return iv
    }()
    
    
    let profileTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string: "Profile Name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "\n9 Aug at: 09:00", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let statusText: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Some very very long long long long long long long long long long news description."
        return label
    }()
    
    let newsImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        iv.clipsToBounds = true
        iv.image = UIImage(named: "misha")
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImage)
        addSubview(profileTitle)
        addSubview(newsImage)
        addSubview(statusText)
        
        setProfileImageConstraints()
        setProfileNameConstraints()
        setStatusTextConstraints()
        setNewsImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setProfileImageConstraints() {
        profileImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
    }
    
    fileprivate func setProfileNameConstraints() {
        profileTitle.anchor(top: topAnchor, left: profileImage.rightAnchor, bottom: profileImage.bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    }
    
    fileprivate func setNewsImageConstraints() {
        newsImage.anchor(top: statusText.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setStatusTextConstraints() {
        statusText.anchor(top: profileImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}
