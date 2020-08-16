//
//  HeaderSectionLabel.swift
//  GeekCourseApp
//
//  Created by MacMini on 05.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class HeaderSectionView: UIView {
    
    let headerTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        label.textColor = .lightGray
        label.contentMode = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerTitle)
        setHeaderTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setHeaderTitleLabelConstraints() {
    headerTitle.translatesAutoresizingMaskIntoConstraints = false
    headerTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
    headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    headerTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}

