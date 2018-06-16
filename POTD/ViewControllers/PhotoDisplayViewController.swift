//
//  ViewController.swift
//  POTD
//
//  Created by Jon-Tait Beason on 4/30/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoDisplayViewController: UIViewController {
    /// MARK:- Variables
    fileprivate var presentationModel: PhotoDisplayPresentationModel?
    
    /// MARK:- Outlets
    @IBOutlet weak var potdImageView: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleLabel: UILabel!
    
    /// MARK:- Actions
    @IBAction func submitDate(_ sender: Any) {
        presentationModel?.loadPODFor(date: datePicker.date)
    }
    
    /// MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.maximumDate = Date()
        
        presentationModel = PhotoDisplayPresentationModel(today: datePicker.date)
        presentationModel?.delegate = self
        presentationModel?.loadPODFor(date: datePicker.date)
    }
}

// MARK: - Delegate
extension PhotoDisplayViewController: PhotoDisplayPresentationModelDelegate {
    /// Load pod
    ///
    /// - Parameter apod: pod.
    func load(apod: Apod) {
        guard
            let url = URL(string: apod.url)
            else  { fatalError("Unable to create url.") }
        
        /// Load image with Kingfisher and update info label upon return
        potdImageView.kf.setImage(with: url,
                                  placeholder: nil,
                                  options: nil,
                                  progressBlock: nil) { _, _, _, _ in
                                    
            DispatchQueue.main.async {
                [weak self] in
                self?.titleLabel.text = apod.title
            }
        }
    }
    
    /// Update UI to reflect loading state
    func loading() {
        DispatchQueue.main.async {
            [weak self] in
            self?.titleLabel.text = self?.presentationModel?.loadingText
        }
    }
}

