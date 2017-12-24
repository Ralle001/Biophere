//
//  ViewController.swift
//  Biophere
//
//  Created by Coder on 2017. 10. 22..
//  Copyright © 2017. Pliz Help. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textview: UITextField!
    @IBOutlet weak var conv: UILabel!
    var convert: Int? = nil
    var volumeText: Int? = nil
    
    // Teljsen felesleges duplán tárolni ezeket a szövegeket, az UI komponensek már tárolják
    var waterVolume: Int? = nil // Csupán az aktuális átváltott értéket érdemes tárolni, de talán még ezt sem
    // mivel nagyon olcsó újraszámitani
    
    
    
    @IBAction func pass(_ sender: Any) {
        // Ez a függvény csupán egy új lokális változót deklarál, semmi köze sincs az osztály tagjaihoz,
        // ezért simán kivehetjük őket
        //        var txt: String {
        //            get {
        //                return textview.text ?? ""
        //            }
        //            set {
        //                textview.text = newValue
        //            }
        //        }
        //conv.text = txt
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Mivel mindkét érték nil, ezért nincs értelme ennek a két hivásnak
        //txt = textview.text!
        //label.text = "\(waterVolume)"
        if let watervolume = waterVolume {
            label.text = String(watervolume)
        } else {
            label.text = ""
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        // Ha az értéket csak a gomb lenyomása után szeretnénk kiszámolni akkor felesleges a fentebbi pass függvény
        if let volumeText = self.textview.text, let convertedValue = Int(volumeText) {
            self.waterVolume = convertedValue
            
            if waterVolume != nil && volumeText != nil{
               convert = Int(waterVolume) - Int(volumeText)!
        }
            }
            //self.conv.text = volumeText
        }
        //        if let textint = Int(text!), let txtint = Int(txt!) {
        //            convert = String(textint - txtint)
        //            conv.text = convert
        //        } else{
        //            //handle it
        //        }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
