//
//  ViewController.swift
//  Light
//
//  Created by noone on 16.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var screenColor: Int = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black
        updateUI()
    }

    fileprivate func updateUI() {
        switch screenColor {
        case 0:
            view.backgroundColor = .red
        case 1:
            view.backgroundColor = .yellow
        case 2:
            view.backgroundColor = .green
        default:
            view.backgroundColor = .red
            screenColor = 0
        }
        screenColor += 1
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateUI()
    }
    
    
}

