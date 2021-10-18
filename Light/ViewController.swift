//
//  ViewController.swift
//  Light
//
//  Created by noone on 16.10.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var screenColor: Int = 0
    
    @IBOutlet weak var torchButton: UIButton!
    
    var torchButtonTitle = "Off"
    
    let device = AVCaptureDevice.default(for: AVMediaType.video)
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

        // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // This func is changing the screen color.
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
    // This func is calling the func which switches the torch on&off, and changing the title in torchButton
    @IBAction func torchButtonPressed(_ sender: Any) {
        
        torchOnOff()
        torchButtonTitle = torchButtonTitle == "Off" ? "On" : "Off"
        torchButton.setTitle(torchButtonTitle, for: .normal)
    }
    
    
    // Func which switches the torch on&off
    func torchOnOff() {
        
        if ((device?.hasTorch) != nil) {
            do {
                try device?.lockForConfiguration()
                device?.torchMode = device?.torchMode == AVCaptureDevice.TorchMode.on ? .off : .on
            } catch {
                print(error)
            }
            device?.unlockForConfiguration()
            
        }
        
    }
    
    // When touching the screen, its color is changed: red, yellow, white.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateUI()
    }
    
    
}

