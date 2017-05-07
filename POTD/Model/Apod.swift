//
//  Apod.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/7/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation
import SwiftyJSON

// A picture of the day 
// model
struct Apod {
    let explanation: String
    let hdUrl: String
    let url: String
    let title: String
}

extension Apod {
    init(json: JSON) {
        self.explanation = json["explanation"].stringValue
        self.hdUrl = json["hdurl"].stringValue
        self.title = json["title"].stringValue
    }
}
