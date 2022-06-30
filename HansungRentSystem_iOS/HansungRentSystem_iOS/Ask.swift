//
//  Ask.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class Ask : UIViewController {
    //var user : User!
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        print("@@@@@@@@@@@@@@@@")
    }
    @IBAction func samsungBtn(_ sender: UIButton) {
        callShowAPI(brand: "samsung")
        
    }
    @IBAction func lgBtn(_ sender: UIButton) {
        callShowAPI(brand: "lg")

    }
    @IBAction func msiBtn(_ sender: UIButton) {
        callShowAPI(brand: "msi")

    }
    @IBAction func appleBtn(_ sender: UIButton) {
        callShowAPI(brand: "apple")

    }
    func callShowAPI(brand: String) {
        let request = NSMutableURLRequest(url: NSURL(string: "http://localhost:8080/API/show?brand="+brand)! as URL)
        print(request)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil {
                print("http connect error")
                return
            }
            if let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
            
                let resultString = String(describing: responseString)
                
                var dicData : Dictionary<String, Any> = [String : Any]()
                    do {
                        // 딕셔너리에 데이터 저장 실시
                        dicData = try JSONSerialization.jsonObject(with: Data(resultString.utf8), options: []) as! [String:Any]
                        DispatchQueue.main.sync {
                            let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
                            if let lvc = storyBoard?.instantiateViewController(withIdentifier: "List") as? List {
                                
                                var objList = [Object]()

                                if let data = dicData["Data"] as? [[String : Any]] {
                                    for i in data {
                                        let temp = i["status"] as! String
                                        if temp == "대여가능" {
                                            let obj = Object(code: i["code"] as! String, name: i["name"] as! String, rentDate: "", returnDate: "", userId: i["userId"] as! String, userPhone: i["userPhone"] as! String, status: "대여", boolRent: true)
                                            objList.append(obj)
                                        }
                                        else {
                                            let obj = Object(code: i["code"] as! String, name: i["name"] as! String, rentDate: i["rentDate"] as? String ?? "", returnDate: i["returnDate"] as? String ?? "", userId: i["userId"] as! String, userPhone: i["userPhone"] as! String, status: "불가", boolRent: false)
                                            objList.append(obj)
                                        }
                                        
                                    }
                                }
                                lvc.objList = objList
                                //lvc.user = self.user
                                self.navigationController?.pushViewController(lvc, animated: true)
                            }
                        }
                    } catch {
                        DispatchQueue.main.async{
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
