//
//  User.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/27.
//

import Foundation
class User {
    var userId : String
    var password : String
    var userName : String
    var isRented : String
    
    init(userId : String, password: String, userName: String, isRented: String) {
        self.userId = userId
        self.password = password
        self.userName = userName
        self.isRented = isRented
    }
    

    
}
