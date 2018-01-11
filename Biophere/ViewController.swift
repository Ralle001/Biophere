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
    var precentageDifference: Float? = nil
    
    private var _maxWaterLevel: Int?
    private var _gestureRecognizer: UITapGestureRecognizer?
    
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
        }
    }
    
    @IBAction func Calc(_ sender: Any) {
        if precentageDifference != nil && precentageDifference! > 90.0 && precentageDifference! <= 100.0 {
            
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
