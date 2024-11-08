//
//  Symbol.swift
//  CatClicker
//
//  Created by Mason Z on 11/7/24.
//

import Foundation

struct Symbol {
    var image: String
    var love: Int
    
    init(image: String = "food", love: Int = 10) {
        self.image = image
        self.love = love
    }
    
}
