//
//  ViewController.swift
//  generateBarCodeAndQRCode
//
//  Created by MGXA2 on 3/6/17.
//  Copyright © 2017 Duc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnBarCode: UIButton!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var imgOutput: UIImageView!
    var str: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func btnBarCode(_ sender: Any) {
        str = txtInput.text!
        imgOutput.image = generateBarCode(from: str)
    }
    @IBAction func btnQRCode(_ sender: Any) {
        str = txtInput.text!
        imgOutput.image = generateQRCode(from: str)
    }
    
    func generateBarCode(from str: String) -> UIImage? {
        let data = str.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    func generateQRCode(from str: String) -> UIImage? {
        let data = str.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }

}

