//
//  MyButton.swift
//  quizFlag
//
//  Created by Laurent Mery on 09/08/2018.
//  Copyright © 2018 Laurent Mery. All rights reserved.
//

import UIKit

class MyButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        customDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customDisplay()
    }

    func customDisplay () {
        tintColor = UIColor.white
        backgroundColor = UIColor.lightGray
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
    }
}
