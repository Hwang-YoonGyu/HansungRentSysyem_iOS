//
//  MyPage.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class LogPage : UIViewController, UITableViewDataSource, UITableViewDelegate {
    var user : User!
    var logList = [Log]()

    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
extension LogPage {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogTableViewCell")
        let log = logList[indexPath.row]
        
        (cell?.contentView.subviews[0] as! UILabel).text = log.code
        (cell?.contentView.subviews[1] as! UILabel).text = log.rentDate
        (cell?.contentView.subviews[2] as! UILabel).text = " ~ "+log.returnDate
        print(log.rentDate + " "+log.returnDate)
        return cell!
    }
}
