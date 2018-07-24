//
//  ViewController.swift
//  Restaurant of Fate
//
//  Created by Christopher Gerencser and Jared Schwartz on 12/12/17.
//  Copyright © 2017 Jared Schwartz. All rights reserved.
//

import UIKit

var maxDistance = 0
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var pickerView: UIPickerView!
    

    @IBAction func go(_ sender: AnyObject) {
    performSegue(withIdentifier: "segue1", sender: self)
    }
    
    let distances = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return distances[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return distances.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        maxDistance = row + 1
        print(maxDistance)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

