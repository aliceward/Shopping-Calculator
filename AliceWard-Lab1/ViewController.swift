//
//  ViewController.swift
//  AliceWard-Lab1
//
//  Created by Alice Ward on 9/10/18.
//  Copyright © 2018 Alice Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var original: UITextField!
    @IBOutlet weak var discount: UITextField!
    @IBOutlet weak var tax: UITextField!
    
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var dealOrNoDeal: UILabel!
    
    @IBAction func originalEdited(_ sender: Any) {
        updateDisplay()
    }
    
    @IBAction func discountEdited(_ sender: Any) {
        updateDisplay()
    }
    
    @IBAction func taxEdited(_ sender: Any) {
        updateDisplay()
    }
    
    func updateDisplay() {
        var originalP:Double=0.0
        var discountP:Double=0.0
        var taxP:Double=0.0
        
        //if let statements to handle optionals
        if let tempOriginal = original.text {
            if let numOriginal = Double(tempOriginal) {
                originalP = numOriginal
            }
        }else{
            
        }
    
        if let tempDiscount = discount.text{
            if let numDiscount = Double(tempDiscount){
                discountP = numDiscount
            }
        }else{
            
        }
        
        if let tempTax = tax.text{
            if let numTax = Double(tempTax){
                taxP = numTax
            }
        }else{
        }
        
        //Calculation of final price
        let p = originalP*(1-discountP/100)*(1+taxP/100)
        if p<0 {
            finalPrice.text=""
        }
        else{
            finalPrice.text="$\(String(format: "%.2f", p))"
        }

        
        //Creative Portion
        if (p < originalP && originalP != 0.0 && discountP != 0.0 && taxP != 0.0 && p >= 0) {
            //Checking to make sure values aren't nil
            dealOrNoDeal.textColor = UIColor(red:1.00, green:0.49, blue:0.98, alpha:1.0)
            dealOrNoDeal.text="What a great deal!"
            view.backgroundColor = UIColor(red:1.00, green:0.94, blue:0.99, alpha:1.0)
        }
        else if (originalP != 0.0 && discountP != 0.0 && taxP != 0.0 && p>0){
            dealOrNoDeal.textColor = UIColor(red:0.24, green:0.56, blue:0.85, alpha:1.0)
            dealOrNoDeal.text="Not a good deal."
            view.backgroundColor = UIColor(red:0.74, green:0.85, blue:0.87, alpha:1.0)
        }
        else{
            //Show nothing if values aren't edited
            dealOrNoDeal.text=""
            view.backgroundColor = UIColor.white
        }
        
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

