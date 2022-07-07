//
//  ViewController.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/22.
//

import UIKit
import Foundation

class Login: UIViewController {

    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var autoLoginSwitch: UISwitch!
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    

    @IBAction func loginBtn(_ sender: UIButton) {
        doLogin(id: idField.text!, pwd: pwdField.text!)
        

    }
    func doLogin(id : String, pwd : String) {
        let request = NSMutableURLRequest(url: NSURL(string: "http://223.194.158.173:8080/API/login?userId="+id+"&password="+pwd)! as URL)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil {
                DispatchQueue.main.async{
                    let alert = UIAlertController(title:"로그인 실패",message: "API서버 접속 오류입니다. 인터넷연결을 확인하거나, 다시 시도해 주세요.",preferredStyle: UIAlertController.Style.alert)
                    //확인 버튼 만들기
                    let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert,animated: true,completion: nil)
                }
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
                            if let mvc = storyBoard?.instantiateViewController(withIdentifier: "Main") as? Main {
//                                mvc.user = User(userId: dicData["id"]! as! String, password: dicData["password"]! as! String, userName: dicData["userName"]! as! String, isRented: dicData["isRented"]! as! String, userPhone: dicData["userPhone"] as! String)
                                let user = User.instance
                                user.userId = dicData["id"]! as! String
                                user.userPhone = dicData["userPhone"]! as! String
                                user.password = dicData["password"]! as! String
                                user.userName = dicData["userName"]! as! String
                                user.isRented = dicData["isRented"]! as! String
                                if(self.autoLoginSwitch.isOn == true){
                                    let fileURL = self.documentDirectory.appendingPathComponent("info.txt")
                                    
                                
                                    var text:String = ""
                                    text.append(contentsOf: id)
                                    text.append(contentsOf: " ")
                                    text.append(contentsOf: pwd)
                                
                                    do {
                                    //파일 생성하여 text내용을 fileURL에 저장
                                        try text.write(to: fileURL, atomically: true, encoding: .utf8)
                                    } catch let e {
                                    //오류 처리
                                        print(e.localizedDescription)
                                    }
                                }
                                self.navigationController?.pushViewController(mvc, animated: true)
                            }
                        }
                    } catch {
                        DispatchQueue.main.async{
                            print(error.localizedDescription)
                            let alert = UIAlertController(title:"로그인 실패",message: "아이디와 비밀번호를 확인해주세요.",preferredStyle: UIAlertController.Style.alert)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = documentDirectory.appendingPathComponent("info.txt")
        do{
        let textContent = try String(contentsOf: fileURL, encoding: .utf8)
            print(textContent)
           
            if(textContent != ""){
               let temp = textContent.split(separator: " ")
                doLogin(id: String(temp[0]), pwd: String(temp[1]))
            }

            else{
                print("file not exist")
            }
        }
        catch let e {
            // 5-2. 에러처리
            print(e.localizedDescription)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }


}

                                         
extension Login{
    @objc func dismissKeyboard(sender: UIGestureRecognizer){
        idField.resignFirstResponder()
        pwdField.resignFirstResponder()
    }
}
                                         
