//
//  Extension.swift
//  quizFlag
//
//  Created by Laurent Mery on 09/08/2018.
//  Copyright © 2018 Laurent Mery. All rights reserved.
//

import UIKit


extension Int {
    
    func getRandom(max: Int) -> Int {
        
        return Int(arc4random_uniform(UInt32(max)))
    }
}
