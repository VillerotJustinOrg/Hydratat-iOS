//
//  Avatar.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import Foundation

struct Avatar {
    var id_avatar = UUID()
    var color1: String
    var color2: String
    
    mutating func equalsTo(avatar: Avatar) -> Bool {
        return self.id_avatar == avatar.id_avatar && self.color1 == avatar.color1 && self.color2 == avatar.color2
    }
}
