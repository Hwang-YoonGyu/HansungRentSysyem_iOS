//
//  Notice.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class Notice : UIViewController, UITableViewDataSource, UITableViewDelegate {
//    var user : User!
    var notiList = [Noti]()

    
    @IBOutlet weak var tableview: UITableView!
    @IBAction func bakcBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    
}
extension Notice {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotiTableViewCell")
        let noti = notiList[indexPath.row]
        
        (cell?.contentView.subviews[0] as! UILabel).text = noti.Date
        (cell?.contentView.subviews[1] as! UITextView).text = noti.Detail
        print(noti.userId + " " + noti.Date + " " + noti.Detail)
        return cell!
    }
}
