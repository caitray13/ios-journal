//
//  Item.swift
//  Journal
//
//  Created by Caitlin Ray on 08/02/2024.
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
