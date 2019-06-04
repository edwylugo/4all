//
//  API.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import Foundation

struct API {
    static let api_base = "http://dev.4all.com:3003"
    static let url_tasksList = "\(API.api_base)/tarefa"
    static let url_taskID = "\(API.api_base)/tarefa/%@"
}
