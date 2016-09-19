//
//  ViewController.swift
//  ControllerElementsDemo-iOS
//
//  Created by James Bean on 9/15/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import UIKit
import ControllerElements

class ViewController: UIViewController {

    let d = Dial(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let s = Slider(frame: CGRect(x: 0, y: 0, width: 20, height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        d.position = CGPoint(x: 100, y: 0.5 * view.frame.width)
        view.layer.addSublayer(d)
        
        d.ramp(to: 0.75, over: 20)
        
        s.position.x = 0.5 * view.frame.width
        s.position.y = 200
        view.layer.addSublayer(s)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = sender.value
        d.value = value
        s.value = value
    }
}
