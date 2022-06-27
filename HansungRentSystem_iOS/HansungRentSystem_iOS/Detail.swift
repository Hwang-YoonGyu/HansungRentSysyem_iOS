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

    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rentBtn(_ sender: UIButton) {
    }
}
