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
    
    @IBAction func detailBtn1(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc = storyBoard?.instantiateViewController(withIdentifier: "DetailInfo") as? DetailInfo {
            dvc.name = "macbookPro"
            dvc.code = "MVVJ2KH/A"
            dvc.image = UIImage(named: "macbookpro.png")
            dvc.cpu = "CPU : i7-9750H"
            dvc.memory = "메모리 : 16GB"
            dvc.graphic = "GPU : 라데온 Pro 5300M"
            dvc.screen = "화면 : 40.8cm(16인치)"
            dvc.weight = "무게 : 2.0kg"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    @IBAction func detailBtn2(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc = storyBoard?.instantiateViewController(withIdentifier: "DetailInfo") as? DetailInfo {
            dvc.name = "macbookAir"
            dvc.code = "MGN63KH/A"
            dvc.image = UIImage(named: "macbookair.jpg")
            dvc.cpu = "CPU : Apple Silicon M1"
            dvc.memory = "메모리 : 8GB"
            dvc.graphic = "GPU : Apple Silicon M1"
            dvc.screen = "화면 : 33.78cm(13.3인치)"
            dvc.weight = "무게 : 1.29kg"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    @IBAction func detailBtn3(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc = storyBoard?.instantiateViewController(withIdentifier: "DetailInfo") as? DetailInfo {
            dvc.name = "삼성Odyssey"
            dvc.code = "NT800G5W-XD71"
            dvc.image = UIImage(named: "odyssey.jpg")
            dvc.cpu = "CPU : i7-7700HQ"
            dvc.memory = "메모리 : 8GB"
            dvc.graphic = "그래픽카드 : GTX1050"
            dvc.screen = "화면 : 39.62cm(15.6인치)"
            dvc.weight = "무게 : 2.5kg"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    @IBAction func detailBtn4(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc = storyBoard?.instantiateViewController(withIdentifier: "DetailInfo") as? DetailInfo {
            dvc.name = "삼성Odyssey"
            dvc.code = "NT800G5W-XD7S"
            dvc.image = UIImage(named: "odyssey.jpg")
            dvc.cpu = "CPU : i7-7700HQ"
            dvc.memory = "메모리 : 8GB"
            dvc.graphic = "그래픽카드 : GTX1050"
            dvc.screen = "화면 : 39.62cm(15.6인치)"
            dvc.weight = "무게 : 2.5kg"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    @IBAction func detailBtn5(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc = storyBoard?.instantiateViewController(withIdentifier: "DetailInfo") as? DetailInfo {
            dvc.name = "삼성Odyssey"
            dvc.code = "NT800G5W-GD7A"
            dvc.image = UIImage(named: "odyssey.jpg")
            dvc.cpu = "CPU : i7-7700HQ"
            dvc.memory = "메모리 : 8GB"
            dvc.graphic = "그래픽카드 : GTX1050"
            dvc.screen = "화면 : 39.62cm(15.6인치)"
            dvc.weight = "무게 : 2.5kg"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    @IBAction func detailBtn6(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc = storyBoard?.instantiateViewController(withIdentifier: "DetailInfo") as? DetailInfo {
            dvc.name = "삼성Odyssey"
            dvc.code = "NT800G5W-X01/C"
            dvc.image = UIImage(named: "odyssey.jpg")
            dvc.cpu = "CPU : i7-7700HQ"
            dvc.memory = "메모리 : 16GB"
            dvc.graphic = "그래픽카드 : GTX1060"
            dvc.screen = "화면 : 39.62cm(15.6인치)"
            dvc.weight = "무게 : 2.5kg"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    @IBAction func detailBtn7(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc = storyBoard?.instantiateViewController(withIdentifier: "DetailInfo") as? DetailInfo {
            dvc.name = "LG그램15"
            dvc.code = "15Z90N-VP70ML"
            dvc.image = UIImage(named: "LG_gram.jpg")
            dvc.cpu = "CPU : i7-1065G7"
            dvc.memory = "메모리 : 8GB"
            dvc.graphic = "GPU : 인텔 Iris Plus Graphics"
            dvc.screen = "화면 : 39.62cm(15.6인치)"
            dvc.weight = "무게 : 1120g"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    @IBAction func detailBtn8(_ sender: UIButton) {
        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let dvc = storyBoard?.instantiateViewController(withIdentifier: "DetailInfo") as? DetailInfo {
            dvc.name = "MSI소드"
            dvc.code = "GF66-A11UD"
            dvc.image = UIImage(named: "MSI_sword.jpg")
            dvc.cpu = "CPU : 코어i7-11세대"
            dvc.memory = "메모리 : 8GB"
            dvc.graphic = "GPU : RTX3050 Ti"
            dvc.screen = "화면 : 39.62cm(15.6인치)"
            dvc.weight = "무게 : 2.25kg"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
}


