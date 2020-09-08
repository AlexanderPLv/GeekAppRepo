//
//  GroupsCell.swift
//  GeekCourseApp
//
//  Created by MacMini on 07.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

import UIKit

class GroupsTableCell: UITableViewCell, ReusableView {
    
    func set(_ group: Group?) {
        titleLabel.text = group?.name
        
        guard let imageUrl = group?.imageURL else { return }
        cellsImage.loadImage(urlString: imageUrl)
    }
    
    let cellsImage: CustomImageView = {
        let iv = CustomImageView(image: #imageLiteral(resourceName: "select_photo_empty"))
        iv.layer.cornerRadius = 40
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        return iv
    }()
       
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.contentMode = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(cellsImage)
        addSubview(titleLabel)

        setImagesConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: cellsImage.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cellsImage.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
    }
    
   fileprivate func setImagesConstraints() {
    cellsImage.translatesAutoresizingMaskIntoConstraints = false
    cellsImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    cellsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
    cellsImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    cellsImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    }
    
}
