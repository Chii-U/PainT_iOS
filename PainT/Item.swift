//
//  Item.swift
//  PainT
//
//  Created by 최승희 on 4/26/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
