//
//  Log.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/30.
//

import Foundation

class Log {
    var code : String
    var name : String
    var userId : String
    var userPhone : String
    var rentDate : String
    var returnDate : String
    
    init (code : String, name : String, userId : String, userPhone : String, rentDate : String, returnDate : String) {
        self.code = code
        self.name = name
        self.userId = userId
        self.userPhone = userPhone
        self.rentDate = rentDate
        self.returnDate = returnDate
    }
}
