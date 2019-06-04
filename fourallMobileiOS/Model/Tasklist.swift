//
//  Tasklist.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit
import ObjectMapper

class Tasklist : Mappable {
    var idList = [String]()
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        idList <- map["lista"]
    }
    
}
