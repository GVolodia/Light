//
//  ViewController.swift
//  Light
//
//  Created by noone on 16.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn: Bool = true
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black
        updateUI()
    }

    fileprivate func updateUI() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    
    @IBAction func buttonPrsd() {
        //isLightOn = !isLightOn
        isLightOn.toggle()
        updateUI()
    }
    
}

