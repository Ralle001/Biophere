//
//  SettingsViewController.swift
//  Biophere
//
//  Created by Coder on 2017. 11. 06..
//  Copyright © 2017. Pliz Help. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var intxt: UITextField!
    var num: Int? = nil
    var minusstr: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let ViewController = segue.destination as? ViewController
            // Ez egy rossz paradigma, erdemesebb egy kulon getterbe tenni, ha muszaj akkor inkabb igy:
            ViewController?.waterVolume = Int(intxt.text!) ?? nil
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
