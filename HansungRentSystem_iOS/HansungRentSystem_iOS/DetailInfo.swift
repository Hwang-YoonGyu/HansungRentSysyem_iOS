//
//  DetailInfo1.swift
//  HansungRentSystem_iOS
//
//  Created by 조진웅 on 2022/08/16.
//

import UIKit

class DetailInfo: UIViewController {
    var name: String! = ""
    var code: String! = ""
    var image: UIImage!
    var cpu: String! = ""
    var memory: String! = ""
    var graphic: String! = ""
    var screen: String! = ""
    var weight: String! = ""
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var codeText: UILabel!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var cpuText: UILabel!
    @IBOutlet weak var memoryText: UILabel!
    @IBOutlet weak var graphicText: UILabel!
    @IBOutlet weak var screenText: UILabel!
    @IBOutlet weak var weightText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = name
        codeText.text = code
        Image.image = image
        cpuText.text = cpu
        memoryText.text = memory
        graphicText.text = graphic
        screenText.text = screen
        weightText.text = weight
    }
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
