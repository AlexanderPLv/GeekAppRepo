//
//  NewsFeedCell.swift
//  GeekCourseApp
//
//  Created by MacMini on 09.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell, ReusableView {
    
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
        
        attributedText.append(NSAttributedString(string: "\n9 Aug at: 09:00", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.lGray]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let statusText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let newsImage: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        iv.clipsToBounds = true
        iv.image = UIImage(named: "misha")
        return iv
    }()
    
    let likeControl: CustomControl = {
        let customControl = CustomControl()
        customControl.image = UIImage(named: "like_unselected")
        customControl.tintColor = .lGray
        customControl.contentMode = .center
        return customControl
    }()
    
    let shareControl: CustomControl = {
        let customControl = CustomControl()
        customControl.image = UIImage(systemName: "arrowshape.turn.up.right")
        customControl.tintColor = .lGray
        customControl.contentMode = .center
        return customControl
    }()
    
    let commentControl: CustomControl = {
        let customControl = CustomControl()
        customControl.image = UIImage(systemName: "message")
        customControl.tintColor = .lGray
        customControl.contentMode = .center
        return customControl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubview(profileImage)
        addSubview(profileTitle)
        addSubview(newsImage)
        addSubview(statusText)
        
        setProfileImageConstraints()
        setProfileNameConstraints()
        setStatusTextConstraints()
        setNewsImageConstraints()
        setupBottomBarStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ news: News) {
        likeControl.text = String(news.likes?.count ?? 0)
        commentControl.text = String(news.comments?.count ?? 0)
        shareControl.text = String(news.reposts?.count ?? 0)
        statusText.text = news.text
        profileTitle.text = news.profileName
    }
    
    
    
    
    
    fileprivate func setupBottomBarStack() {
        let stackView = UIStackView(arrangedSubviews: [
            likeControl,
            commentControl,
            shareControl
        ])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 10
        addSubview(stackView)
        
        stackView.anchor(top: newsImage.bottomAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: nil,
                         paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                         width: ((frame.width/4)*3), height: 50)
    }
    
    fileprivate func setProfileImageConstraints() {
        profileImage.anchor(top: topAnchor,
                            left: leftAnchor,
                            bottom: nil,
                            right: nil,
                            paddingTop: 12, paddingLeft: 8, paddingBottom: 0, paddingRight: 0,
                            width: 40, height: 40)
    }
    
    fileprivate func setProfileNameConstraints() {
        profileTitle.anchor(top: topAnchor,
                            left: profileImage.rightAnchor,
                            bottom: profileImage.bottomAnchor,
                            right: rightAnchor,
                            paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 8,
                            width: 0, height: 0)
    }
    
    fileprivate func setNewsImageConstraints() {
        newsImage.anchor(top: statusText.bottomAnchor,
                         left: leftAnchor,
                         bottom: nil,
                         right: rightAnchor,
                         paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                         width: 0, height: 0)
    }
    
    fileprivate func setStatusTextConstraints() {
        statusText.anchor(top: profileImage.bottomAnchor,
                          left: leftAnchor,
                          bottom: nil,
                          right: rightAnchor,
                          paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0,
                          width: 0, height: 0)
    }
    
}
