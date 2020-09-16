//
//  CustomUIControl.swift
//  GeekCourseApp
//
//  Created by MacMini on 15.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

public final class CustomControl: UIControl {
    
  fileprivate let imageView: UIImageView = {
       let iv = UIImageView()
       return iv
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .equalSpacing
        sv.alignment = .center
        return sv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        addSubview(stackView)
        stackView.anchor(top: layoutMarginsGuide.topAnchor,
                         left: layoutMarginsGuide.leftAnchor,
                         bottom: layoutMarginsGuide.bottomAnchor,
                         right: layoutMarginsGuide.rightAnchor,
                         paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                         width: 0, height: 0)
    }
}

public extension CustomControl {
    
    var image: UIImage? {
      get {
        return imageView.image
      }
      set {
        imageView.image = newValue?.withRenderingMode(.alwaysTemplate)
      }
    }
    
    var text: String? {
      get {
        return label.text
      }
      set {
        label.text = newValue
      }
    }
    
}
