//
//  Friend.swift
//  Birthdays
//
//  Created by Todd McFarlin on 9/22/26.
//

import Foundation
import SwiftData

@Model
class Friend{
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
}
