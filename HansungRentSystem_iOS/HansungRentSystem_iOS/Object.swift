//
//  Object.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/27.
//

import Foundation
class Object {
    var code : String
    var name : String
    var rentDate : String
    var returnDate : String
    var userId : String
    var userPhone : String
    var status : String
    var boolRent : Bool
    var boolAni : Bool
    
    init(code : String, name : String, rentDate : String, returnDate: String, userId : String, userPhone : String, status : String, boolRent: Bool, boolAni: Bool) {
        self.code = code
        self.name = name
        self.rentDate = rentDate
        self.returnDate = returnDate
        self.userId = userId
        self.userPhone = userPhone
        self.status = status
        self.boolRent = boolRent
        self.boolAni = boolAni
    }
    
}
