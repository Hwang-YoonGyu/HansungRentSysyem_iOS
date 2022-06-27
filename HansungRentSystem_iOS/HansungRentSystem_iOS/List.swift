//
//  List.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class List : UIViewController {
    
    var user : User!
    var objList = [Object]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        
    }
    

}
//extension MainViewController {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return labtopGroup.getLabtops().count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "LabtopTableViewCell")
//        let labtop = labtopGroup.getLabtops()[indexPath.row]
//        (cell?.contentView.subviews[0] as! UILabel).text = labtop.name
//        (cell?.contentView.subviews[1] as! UILabel).text = labtop.code
//
//        if (labtop.status == "대여중"){ //현재 해당 노트북이 대여중일 때는 버튼을 비활성화 시킴
//            (cell?.contentView.subviews[2] as! UIButton).isEnabled = false;
//            (cell?.contentView.subviews[2] as! UIButton).setTitle("불가", for: .normal)
//
//        }
//        else {
//            (cell?.contentView.subviews[2] as! UIButton).addAction { //Action을 유동적으로 달음
//                //self.gotoDetailMethod(code: labtop.code)
//                let labtop = self.labtopGroup.detailLabtop(code: labtop.code)
//                let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//                                    // 뷰 객체 얻어오기 (storyboard ID로 ViewController구분)
//                if let dvc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
//                    dvc.code = labtop.code
//                    dvc.name = labtop.name
//                    dvc.rentDate = labtop.rentDate.toStringDate()
//                    dvc.returnDate = labtop.returnDate.toStringDate()
//                    dvc.userName = self.userName
//                    dvc.userId = self.userId
//                    dvc.email = self.email
//                    dvc.isRented = self.isRented
//                    dvc.labtopGroup = self.labtopGroup
//                    dvc.mvc = self
//                    print("isRented is "+self.isRented)
//                    self.navigationController?.pushViewController(dvc, animated: true)
//                    //self.present(dvc, animated: true)
//
//                } else {
//                    return
//                }
//            }
//        }
//        print(labtop.code + " " + labtop.status)
//        return cell!
//    }
//}
