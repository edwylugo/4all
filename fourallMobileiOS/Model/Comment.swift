//
//  Comment.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit
import ObjectMapper
class Comment: Mappable {
    var comment = ""
    var title = ""
    var name = ""
    var grade = 0
    var urlPicture = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        comment <- map["comentario"]
        title <- map["titulo"]
        name <- map["nome"]
        grade <- map["nota"]
        urlPicture <- map["urlFoto"]
    }
}

