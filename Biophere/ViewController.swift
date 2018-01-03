//
//  ViewController.swift
//  Biophere
//
//  Created by Coder on 2017. 10. 22..
//  Copyright © 2017. Pliz Help. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textview: UITextField!
    @IBOutlet weak var conv: UILabel!
    var volumeText: Int? = nil
    var atlag: Int? = nil
    
    // Teljsen felesleges duplán tárolni ezeket a szövegeket, az UI komponensek már tárolják
    var waterVolume: Int? = nil // Csupán az aktuális átváltott értéket érdemes tárolni, de talán még ezt sem
    // mivel nagyon olcsó újraszámitani
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textview.delegate = self
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
            if self.waterVolume != nil {
                atlag = self.waterVolume
                self.waterVolume! -= convertedValue
            }
            conv.text = String(self.waterVolume!)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textview.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
