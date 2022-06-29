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
    }
    override func viewDidLoad() {
        nameText.text = obj.name
        codeText.text = obj.code
        rentDateText.text = "???"
        returnDateText.text = "???"
        idText.text = user.userId
        userNameText.text = user.userName
    }
}
