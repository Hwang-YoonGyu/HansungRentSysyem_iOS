//
//  Main.swift
//  HansungRentSystem_iOS
//
//  Created by 황윤규 on 2022/06/23.
//

import Foundation
import UIKit
class Main : UIViewController {
    var user = User.instance
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    
    @IBOutlet weak var userText: UILabel!
    
    override func viewDidLoad() {
        userText.text = user.userId + " " + user.userName
//        DispatchQueue.global().async {
//            var i : Int = 0
//            while true {
//                print(i)
//                i+=1
//                if i == 100 {
//                    break
//                }
//                sleep(1)
//            }
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let fileURL = documentDirectory.appendingPathComponent("noti.txt")
        do{
        let textContent = try String(contentsOf: fileURL, encoding: .utf8)
            print(textContent)
           
            if(textContent != ""){

            }

            else{
                print("file not exist")
            }
        }
        catch let e {
            // 5-2. 에러처리
            print(e.localizedDescription)
        }
        notiMark()
    }
    
    @IBAction func ListBtn(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let mvc = storyBoard?.instantiateViewController(withIdentifier: "Ask") as? Ask {
            //mvc.user = self.user
            self.navigationController?.pushViewController(mvc, animated: true)
        }
    }
    
    @IBAction func LogBtn(_ sender: UIButton) {
        let request = NSMutableURLRequest(url: NSURL(string: "http://223.194.158.173:8080/API/showLog?userId="+user.userId)! as URL)
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
                        // 딕셔너리에 데이터 저장 실시
                        dicData = try JSONSerialization.jsonObject(with: Data(resultString.utf8), options: []) as! [String:Any]
                        DispatchQueue.main.sync {
                            let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
                            if let lpvc = storyBoard?.instantiateViewController(withIdentifier: "LogPage") as? LogPage {
                                var logList = [Log]()

                                if let data = dicData["Data"] as? [[String : Any]] {
                                    for i in data {
                                        let log = Log(code: i["code"] as! String, name: i["name"] as! String, userId: i["userId"] as! String, userPhone: i["userPhone"] as! String, rentDate: i["rentDate"] as! String, returnDate: i["returnDate"] as! String)
                                        logList.append(log)
                                    }
                                }
                                lpvc.logList = logList
                                //lpvc.user = self.user
                                self.navigationController?.pushViewController(lpvc, animated: true)
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
    
    @IBAction func noticeBtn(_ sender: UIButton) {
        let request = NSMutableURLRequest(url: NSURL(string: "http://223.194.158.173:8080/API/noti?userId="+user.userId)! as URL)
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
                        // 딕셔너리에 데이터 저장 실시
                        dicData = try JSONSerialization.jsonObject(with: Data(resultString.utf8), options: []) as! [String:Any]
                        DispatchQueue.main.sync {
                            let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
                            if let nvc = storyBoard?.instantiateViewController(withIdentifier: "Notice") as? Notice {
                                var notiList = [Noti]()

                                if let data = dicData["Data"] as? [[String : Any]] {
                                    for i in data {
                                        let noti = Noti(userId: i["userId"] as! String, Date: i["date"] as! String, Detail: i["detail"] as! String)
                                        notiList.append(noti)
                                    }
                                }
                                nvc.notiList = notiList
                                //lpvc.user = self.user
                                self.navigationController?.pushViewController(nvc, animated: true)
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
//        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
//            if let nvc = storyBoard?.instantiateViewController(withIdentifier: "Notice") as? Notice {
//                var notiList = [Noti]()
//
//                let noti = Noti(userId: "123", Date: "2022-07-07", Detail: "유지연 바보")
//                    let noti2 = Noti(userId: "123", Date: "2022-07-08", Detail: "유지연 멍청이")
//                        notiList.append(noti)
//                        notiList.append(noti2)
//
//                        nvc.notiList = notiList
//                //lpvc.user = self.user
//                self.navigationController?.pushViewController(nvc, animated: true)
//            }
    
    }
    
    
    @IBAction func LogoutBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    func notiMark() {
        let request = NSMutableURLRequest(url: NSURL(string: "http://223.194.158.173:8080/API/noti?userId="+user.userId)! as URL)
        request.httpMethod = "GET"


        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil {
                print("http connect error")
                return
            }
            if let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {

                let resultString = String(describing: responseString)
                let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let fileURL = documentDirectory.appendingPathComponent("noti.txt")
                do {
                //파일 생성하여 text내용을 fileURL에 저장
                    try resultString.write(to: fileURL, atomically: true, encoding: .utf8)
                } catch let e {
                //오류 처리
                    print(e.localizedDescription)
                }
                
                
                
            }
        }
        task.resume()
    }
}

