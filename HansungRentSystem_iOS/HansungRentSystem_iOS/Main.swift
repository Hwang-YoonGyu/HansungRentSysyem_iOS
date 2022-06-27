//
//  Main.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class Main : UIViewController {
    var user : User!

    
    @IBOutlet weak var userText: UILabel!
    
    override func viewDidLoad() {
        userText.text = user.userId + " " + user.userName
    }
    
    @IBAction func ListBtn(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let mvc = storyBoard?.instantiateViewController(withIdentifier: "Ask") as? Ask {
            mvc.user = self.user
            self.navigationController?.pushViewController(mvc, animated: true)
        }
    }
    
    @IBAction func LogBtn(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let lvc = storyBoard?.instantiateViewController(withIdentifier: "LogPage") as? LogPage {
            lvc.user = self.user
            self.navigationController?.pushViewController(lvc, animated: true)
        }
    }
    
    @IBAction func NotificationBtn(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let nvc = storyBoard?.instantiateViewController(withIdentifier: "Notice") as? Notice {
            nvc.user = self.user
            self.navigationController?.pushViewController(nvc, animated: true)
        }
        
    }
    
    @IBAction func LogoutBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
