//
//  Variable.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import Foundation

class Variable<T> {
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T?{
        didSet{
            listener?(value!)
        }
    }
    
    func bind(listener: Listener?){
        self.listener = listener
        listener?(value!)
    }
    
    init(_ v:T) {
        value = v
    }
}
