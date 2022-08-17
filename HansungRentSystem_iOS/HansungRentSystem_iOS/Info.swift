//
//  Info.swift
//  HansungRentSystem_iOS
//
//  Created by 조진웅 on 2022/08/11.
//

import UIKit

class Info: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func macProDetail(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc1 = storyBoard?.instantiateViewController(withIdentifier: "macPro") as? DetailInfo1 {
            self.navigationController?.pushViewController(dvc1, animated: true)
        }
    }
}

