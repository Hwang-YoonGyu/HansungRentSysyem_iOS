//
//  Detail.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class Detail : UIViewController {
    var user = User.instance
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
        //api서버로 이미 누가 빌린 상태인지 한번 더 확인 하고
        //이상없으면 그때 대여
        if user.isRented == "1" {
            DispatchQueue.main.async{
                let alert = UIAlertController(title:"신청 실패",message: "한명당 하나의 기자재만 대여 가능합니다.",preferredStyle: UIAlertController.Style.alert)
                                        //확인 버튼 만들기
                let ok = UIAlertAction(title: "확인", style: .default, handler: {_ in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(ok)
                self.present(alert,animated: true,completion: nil)
            }
        }
        else {
            let request = NSMutableURLRequest(url: NSURL(string: "http://localhost:8080/API/Rent?code="+obj.code+"&userId="+user.userId+"&userPhone="+user.userPhone+"&rentDate="+obj.rentDate+"&returnDate="+obj.returnDate)! as URL)
            request.httpMethod = "GET"
            
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil {
                    print("http connect error")
                    return
                }
                if let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                
                    let resultString = String(describing: responseString)
                    print(resultString)
                    var dicData : Dictionary<String, Any> = [String : Any]()
                    do {
                        dicData = try JSONSerialization.jsonObject(with: Data(resultString.utf8), options: []) as! [String:Any]
                        if dicData["result"] as! String == "1" {
                            DispatchQueue.main.sync{
                                let alert = UIAlertController(title:"신청 완료",message: "승인이 완료되면 과사무실에 방문하여 기자재를 수령해주세요.",preferredStyle: UIAlertController.Style.alert)
                                                        //확인 버튼 만들기
                                let ok = UIAlertAction(title: "확인", style: .default, handler: {_ in
                                    self.lvc.changeStatus(obj: self.obj)
                                    self.user.isRented = "1"
                                    self.navigationController?.popViewController(animated: true)
                                })
                                alert.addAction(ok)
                                self.present(alert,animated: true,completion: nil)
                            }
                        }
                        else if dicData["result"] as! String == "0" {
                            DispatchQueue.main.sync{
                                let alert = UIAlertController(title:"신청 실패",message: "이미 대여되거나 신청된 기자재입니다.",preferredStyle: UIAlertController.Style.alert)
                                                        //확인 버튼 만들기
                                let ok = UIAlertAction(title: "확인", style: .default, handler: {_ in
                                    self.lvc.changeStatus(obj: self.obj)
                                    self.navigationController?.popViewController(animated: true)
                                })
                                alert.addAction(ok)
                                self.present(alert,animated: true,completion: nil)
                            }
                        }
                    } catch {
                        DispatchQueue.main.sync{
                            print(error.localizedDescription)
                            let alert = UIAlertController(title:"오류",message: "API서버 오류입니다. 잠시 후에 다시 시도해 주세요.",preferredStyle: UIAlertController.Style.alert)
                                //확인 버튼 만들기
                            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                            alert.addAction(ok)
                            self.present(alert,animated: true,completion: nil)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    override func viewDidLoad() {
        obj.rentDate = Date.now.toStringDate()
        obj.returnDate = Date.init(timeIntervalSinceNow: 86400*30).toStringDate()
        obj.userId = user.userId
        obj.userPhone = user.userPhone
        obj.status = "불가"
        obj.boolRent = false
        
        
        nameText.text = obj.name
        codeText.text = obj.code
        rentDateText.text = obj.rentDate
        returnDateText.text =  "~ " + obj.returnDate
        idText.text = obj.userId
        userNameText.text = user.userName
        
    }
}
