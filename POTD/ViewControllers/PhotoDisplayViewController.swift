//
//  ViewController.swift
//  POTD
//
//  Created by Jon-Tait Beason on 4/30/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import UIKit

class PhotoDisplayViewController: UIViewController {
    
    // https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2017-05-05
    
    /// MARK:- Outlets
    @IBOutlet weak var potdImageView: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    /// MARK:- Actions
    @IBAction func submitDate(_ sender: Any) {
    }
    
    /// MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

