//
//  ViewController.swift
//  Calc
//
//  Created by mohamed hisham on 7/8/17.
//  Copyright © 2017 hisham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userInTheMiddleOfWritting = false
    // u have to instialize every var if u are not creating init method
    
    var displayValue : Double{
        get{
        
            return Double(display.text!)!
        
        }
        set{
       
            display.text = String(newValue)
        
        }
    // mainly btst5dm el computed property lma tkon ht3ml casting masln l value kol mra tst5dmha wnta htst5dmha kteer
    }
    
    //underscore before the name means that there is no extenal variable
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle
        if (userInTheMiddleOfWritting){
            display.text = display.text! + digit!
        }
        else{
            display.text = digit!
            userInTheMiddleOfWritting = true
            //leh 3mltha force unwrapping msh if let l2ny mot2kd an digit di hyb2a leha value 3shan kol el buttons mktob 3lehom 7agat
            
        }
        //when setting an optional u dont have to unwrap it
        //when ! you get the set state (and it's assosiative value ) in the optional
        
    }
    //    func drawHorizontalLine ( from posX: Double , to posY: Double , using color: UIColor){}
    
    @IBOutlet weak var display: UILabel!
    //why we didint instializr this , coz it is an optional it is already instialized with nil
    // lw 3mltha UILabel ? ht7tag t unwrap f kol use bs 3shan anta 3arf anha msh htb2a nil 2la w ios byft7 el app ht3mlha UILabel! w dah m3nah ank btforce unwrap fl diclration
    
    private var brain = Brain()
    @IBAction func preformOperation(_ sender: UIButton) {
      if (userInTheMiddleOfWritting)
       {
        brain.setOperand(displayValue)
        userInTheMiddleOfWritting = false
       }
        
        
        userInTheMiddleOfWritting = false
        if let mathimaticalSymbol = sender.currentTitle {
            //mmkn bdl ma t unwrap el optional 3shan tyt2kd ano set t3ml kda
            
          brain.preformOp(mathimaticalSymbol)
            if let result = brain.result {
          displayValue = result
            }
        }
    }
    
    
}

