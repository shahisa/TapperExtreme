//
//  ViewController.swift
//  tapper extreme
//
//  Created by John Doe on 1/1/16.
//  Copyright © 2016 Mobile Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    
    //Outlets
    @IBOutlet weak var tapperImg: UIImageView!
    @IBOutlet weak var tapsTxt: UITextField!
    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    @IBAction func onCoinTapped (sender:UIButton!){
        currentTaps++
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    
    @IBAction func onPlayBtnPressed (sender:UIButton!) {
       
        
        if tapsTxt.text != nil && tapsTxt.text != "" {
            
            tapsTxt.hidden = true
            tapperImg.hidden = true
            playButton.hidden = true
            
            coinButton.hidden = false
            tapsLabel.hidden = false

            
            maxTaps = Int(tapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLabel()
            
        }
        
       
        
    }
    
    
    func restartGame(){
        maxTaps = 0
        tapsTxt.text = ""
   
        tapsTxt.hidden = true
        tapperImg.hidden = true
        playButton.hidden = true
        
        coinButton.hidden = false
        tapsLabel.hidden = false

        
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    
    func updateTapsLabel (){
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    @IBAction func onTap(sender: AnyObject) {
        self.view.endEditing(true)
        textFieldShouldReturn(tapsTxt)
    }
   
    func textFieldShouldReturn(tapsTxt: UITextField) -> Bool {
        tapsTxt.resignFirstResponder()
        return true
    }

}

