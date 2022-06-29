//
//  Detail.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class Detail : UIViewController {
    var user : User!
    var obj : Object!
    var lvc : List!
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var codeText: UILabel!
    @IBOutlet weak var rentDateText: UILabel!
    @IBOutlet weak var returnDateText: UILabel!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var userNameText: UILabel!
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rentBtn(_ sender: UIButton) {
        lvc.changeStatus(obj: obj)
        //api서버로 이미 누가 빌린 상태인지 한번 더 확인 하고
        //이상없으면 그때 대여
        navigationController?.popViewController(animated: true)

        
    }
    override func viewDidLoad() {
        obj.rentDate = Date.now.toStringDate()
        obj.returnDate = Date.init(timeIntervalSinceNow: 86400*30).toStringDate()
        obj.userId = user.userId
        obj.userPhone = user.userPhone
        obj.status = "대여중"
        obj.boolRent = false
        
        nameText.text = obj.name
        codeText.text = obj.code
        rentDateText.text = obj.rentDate
        returnDateText.text =  "~ " + obj.returnDate
        idText.text = obj.userId
        userNameText.text = user.userName
        
    }
}
