//
//  List.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
//import ViewAnimator
import UIKit
class List : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //var user : User!
    var objList = [Object]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    func changeStatus(obj : Object) -> Void {
        for i in 0...objList.count {
            if objList[i].code == obj.code {
                objList[i] = obj
                print(objList[i].userId)
                tableView.reloadData()
                break
            }
        }
    }
    
}
extension List {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell")
        let obj = objList[indexPath.row]
        
        (cell?.contentView.subviews[0] as! UILabel).text = obj.name
        (cell?.contentView.subviews[1] as! UILabel).text = obj.code
        let button = cell?.contentView.subviews[2] as! UIButton
        button.isEnabled = obj.boolRent
        button.setTitle(obj.status, for: .normal)

        
        button.enumerateEventHandlers { action, targetAction, event, stop in
            if let action = action {
                // This is a UIAction
                button.removeAction(action, for: event)
            }

        }
        button.addAction { //Action을 유동적으로 달음
            let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let dvc = storyboard?.instantiateViewController(identifier: "Detail") as? Detail {
                //dvc.user = self.user
                dvc.lvc = self
                dvc.obj = obj
                self.navigationController?.pushViewController(dvc, animated: true)        
            } else {
                return
            }
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, willDisplay cell : UITableViewCell, forRowAt indexPath : IndexPath){
            cell.transform = CGAffineTransform(scaleX: 0, y: 0)
            
            UIView.animate(withDuration : 0.5, delay : 0.05 * Double(indexPath.row), animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
}
extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        addAction(UIAction { (action: UIAction) in closure() }, for: .touchUpInside)
    }
}
