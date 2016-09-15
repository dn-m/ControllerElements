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

    let d = Dial(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(d)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = sender.value
        d.value = value
    }
}

