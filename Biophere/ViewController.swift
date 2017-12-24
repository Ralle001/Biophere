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
    var volumeText: Int? = nil
    
    // Teljsen felesleges duplán tárolni ezeket a szövegeket, az UI komponensek már tárolják
    var waterVolume: Int? = nil // Csupán az aktuális átváltott értéket érdemes tárolni, de talán még ezt sem
    // mivel nagyon olcsó újraszámitani
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let watervolume = waterVolume {
            label.text = String(watervolume)
        } else {
            label.text = ""
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        // Ha az értéket csak a gomb lenyomása után szeretnénk kiszámolni akkor felesleges a fentebbi pass függvény
        //A waterVolume (maximum)-ból ki szeretném vonni a textview (volumeText)-ben megadott értéket
        if let volumeText = self.textview.text, let convertedValue = Int(volumeText) {
            self.waterVolume = convertedValue
            conv.text = String(convertedValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
