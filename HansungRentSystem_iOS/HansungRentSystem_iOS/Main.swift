//
//  Main.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class Main : UIViewController {
    
    @IBOutlet weak var userText: UILabel!
    
    var userName : String = ""
    var userId : String = ""
    
    override func viewDidLoad() {
        userText.text = userId + " " + userName
    }
}
