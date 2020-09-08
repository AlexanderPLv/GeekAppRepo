//
//  IndentedLabel.swift
//  GeekCourseApp
//
//  Created by MacMini on 07.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class IndentedLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let customRect = rect.inset(by: insets)
        super.drawText(in: customRect)
    }
}
