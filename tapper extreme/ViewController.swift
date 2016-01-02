//
//  ViewController.swift
//  tapper extreme
//
//  Created by John Doe on 1/1/16.
//  Copyright © 2016 Mobile Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
        hiddenAreas()
        
        if tapsTxt.text != nil && tapsTxt.text != "" {
            
            
            maxTaps = Int(tapsTxt.text!)!
            currentTaps = 0
            
            
        }
        
       
        
    }
    func hiddenAreas (){
        
        tapsTxt.hidden = true
        tapperImg.hidden = true
        playButton.hidden = true
        
        coinButton.hidden = false
        tapsLabel.hidden = false
    }
    
    func restartGame(){
        maxTaps = 0
        tapsTxt.text = ""
        hiddenAreas()
        
    }
    
    func isGameOver() -> Bool{
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    
    func updateTapsLabel (){
        tapsLabel.text = "\(currentTaps) Taps"
    }
}

