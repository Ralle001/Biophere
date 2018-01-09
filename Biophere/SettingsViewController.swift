//
//  SettingsViewController.swift
//  Biophere
//
//  Created by Coder on 2017. 11. 06..
//  Copyright © 2017. Pliz Help. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var loadedWaterTextField: UITextField!
    var num: Int? = nil
    var minusstr: String?
    
    private var _loadedWater: Int?
    
    var loadedWater: Int? {
        get {
            return _loadedWater
        }
        
        set(newValue) {
            _loadedWater = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedWater = self._loadedWater {
            if let loadedWaterTextField = self.loadedWaterTextField {
                loadedWaterTextField.text = String(loadedWater)
            }
        }
    }
    
    @IBAction func onLoadedWaterTextFieldEdit(_ sender: Any) {
        if let loadedWatertext = loadedWaterTextField.text, let loadedWater = Int(loadedWatertext) {
            self._loadedWater = loadedWater
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            // Ez egy rossz paradigma, erdemesebb egy kulon getterbe tenni, ha muszaj akkor inkabb igy:
            if let waterlevel = self._loadedWater {
                viewController.maxWaterLevel = waterlevel
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
