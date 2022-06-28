//
//  Ask.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class Ask : UIViewController {
    var user : User!
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        print("@@@@@@@@@@@@@@@@")
    }
    
    @IBAction func samsungBtn(_ sender: UIButton) {
        let requset = NSMutableURLRequest(url: NSURL(string: "http://localhost:8080/API/show/brand=samsung")! as URL)
        requset.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: requset as URLRequest) {
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
                        // 딕셔너리에 데이터 저장 실시
                        dicData = try JSONSerialization.jsonObject(with: Data(resultString.utf8), options: []) as! [String:Any]
                        DispatchQueue.main.sync {
                            let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
                            if let lvc = storyBoard?.instantiateViewController(withIdentifier: "List") as? List {

                                var objList = [Object]()
                                for i in 1...(dicData["size"] as! Int) {
                                    
                                }
                                
                                
                                
                                
                                
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
    
    @IBAction func lgBtn(_ sender: UIButton) {
    }
    @IBAction func msiBtn(_ sender: UIButton) {
    }
    @IBAction func appleBtn(_ sender: UIButton) {
    }
}
