//
//  Task.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit
import ObjectMapper

class Task : Mappable {
    var id = ""
    var city = ""
    var neighbourhood  = ""
    var urlPicture = ""
    var urlLogo = ""
    var title = ""
    var phone = ""
    var text = ""
    var address = ""
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    var comments : [Comment]  = []
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["titulo"]
        city <- map["cidade"]
        neighbourhood <- map["bairro"]
        urlPicture <- map["urlFoto"]
        urlLogo <- map["urlLogo"]
        phone <- map["telefone"]
        text <- map["texto"]
        address <- map["endereco"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        comments <- map["comentarios"]
    }
    
}

