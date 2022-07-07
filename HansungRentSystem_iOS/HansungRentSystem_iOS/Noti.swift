//
//  Noti.swift
//  HansungRentSystem_iOS
//
//  Created by jiyeon on 2022/07/07.
//

import Foundation

class Noti {
    var userId : String
    var Date : String
    var Detail : String

    
    init (userId : String, Date : String, Detail : String) {
        self.userId = userId
        self.Date = Date
        self.Detail = Detail
    }
}
