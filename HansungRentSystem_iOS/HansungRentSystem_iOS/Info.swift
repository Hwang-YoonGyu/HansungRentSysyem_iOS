//
//  Info.swift
//  HansungRentSystem_iOS
//
//  Created by 조진웅 on 2022/08/11.
//

import UIKit

class Info: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var infoList = 

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension Info {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
}
