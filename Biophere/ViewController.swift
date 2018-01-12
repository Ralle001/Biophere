//
//  ViewController.swift
//  Biophere
//
//  Created by Coder on 2017. 10. 22..
//  Copyright © 2017. Pliz Help. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var maxWaterVolumeLabel: UILabel!
    @IBOutlet weak var waterUsageTextview: UITextField!
    @IBOutlet weak var conv: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var precentageDifference: Float? = nil
    var percentage: Float = 0.0
    
    private var _maxWaterLevel: Int?
    private var _gestureRecognizer: UITapGestureRecognizer?
    
    var location = CGPoint(x: 0, y: 0)
    
    var maxWaterLevel: Int? {
        get {
            return _maxWaterLevel
        }
        
        set(newValue) {
            _maxWaterLevel = newValue
            recalculate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recalculate()
        waterUsageTextview.delegate = self
        
        _gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        if let gestureRecognizer = _gestureRecognizer {
            self.view.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    private func recalculate() {
        if let maxwaterlevel = self._maxWaterLevel {
            if let maxWaterVolumeLabel = self.maxWaterVolumeLabel {
                maxWaterVolumeLabel.text = String(maxwaterlevel)
            }
        }
    }
    
    @IBAction func waterUsageChanged(_ sender: Any) {
        // A waterVolume (maximum)-ból ki szeretném vonni a textview (volumeText)-ben megadott értéket
        if let maxWatervolumetext = maxWaterVolumeLabel.text,
            let maxWatervolume = Float(maxWatervolumetext),
            let waterusagetext = waterUsageTextview.text,
            let waterUsage = Float(waterusagetext) {
            // vizkülönbség:
            let waterDifference = maxWatervolume - waterUsage
            conv.text = String(waterDifference)
            // százalékosan:
            let precentageDifference = waterDifference / maxWatervolume * 100
            print(precentageDifference) // mehet labelbe
            percentage = precentageDifference
        }
    }
    
    @IBAction func Calc(_ sender: Any) {
        
        
        if percentage != 0.0 && percentage > 90.0 && percentage <= 100.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 80.0 && percentage <= 90.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 70.0 && percentage <= 80.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 60.0 && percentage <= 70.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 50.0 && percentage <= 60.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 40.0 && percentage <= 50.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 30.0 && percentage <= 40.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 20.0 && percentage <= 30.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 10.0 && percentage <= 20.0 {
            
        }
        
        else if percentage != 0.0 && percentage > 0.0 && percentage <= 10.0 {
            
        }
        
        else if percentage != 0.0 && percentage == 0.0 {
            imageView.frame.origin = CGPoint(x: 0, y: 0)
        }
    }
    
    @objc private func dismissKeyboard() {
        waterUsageTextview.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        waterUsageTextview.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SettingsViewController {
            if let maxWaterLevel = self._maxWaterLevel {
                viewController.loadedWater = maxWaterLevel
            }
        }
    }
}
