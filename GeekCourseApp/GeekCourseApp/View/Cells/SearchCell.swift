//
//  SearchCell.swift
//  GeekCourseApp
//
//  Created by MacMini on 06.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell, ReusableView {
    
    let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 40
        iv.clipsToBounds = true
        iv.backgroundColor = .vkBlue
        return iv
    }()
    
    let profileTitle: UILabel = {
       let label = UILabel()
        label.text = "Username"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let separatorView: UIView = {
       let sv = UIView()
        sv.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImageView)
        addSubview(profileTitle)
        addSubview(separatorView)
        setProfileImageConstaints()
        setProfileTitleConstraints()
        setSeparatorConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setProfileImageConstaints() {
        profileImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    fileprivate func setProfileTitleConstraints() {
        profileTitle.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setSeparatorConstraints() {
        separatorView.anchor(top: nil, left: profileTitle.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
}
