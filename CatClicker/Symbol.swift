//
//  Symbol.swift
//  CatClicker
//
//  Created by Mason Z on 11/7/24.
//

import Foundation

struct Symbol { // simple struct to store image name and love level
    var image: String
    var love: Int
    
    init(image: String = "food", love: Int = 10) {
        self.image = image
        self.love = love
    }
    
}
