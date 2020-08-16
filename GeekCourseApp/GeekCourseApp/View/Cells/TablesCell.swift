//
//  TablesCell.swift
//  GeekCourseApp
//
//  Created by MacMini on 05.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class TablesCell: UITableViewCell, ReusableView {
    
    let cellsImage: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
       
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(cellsImage)
        addSubview(titleLabel)
        configureImage()
        configureTitleLabel()
        setImagesConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ data: User) {
        cellsImage.image = UIImage(named: data.image)
        titleLabel.text = data.firstName
    }
    
    fileprivate func configureTitleLabel() {
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 18)
    }

    fileprivate func configureImage() {
        cellsImage.layer.cornerRadius = 40
        cellsImage.clipsToBounds = true
        cellsImage.layer.masksToBounds = true
    }
    
    fileprivate func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: cellsImage.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cellsImage.trailingAnchor, constant: 20).isActive = true
    }
    
   fileprivate func setImagesConstraints() {
    cellsImage.translatesAutoresizingMaskIntoConstraints = false
    cellsImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    cellsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
    cellsImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    cellsImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    }
    
}
