//
//  PhotoDisplayPresentationModelDelegate.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/10/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation

protocol PhotoDisplayPresentationModelDelegate  {
    func load(apod: Apod)
    func loading()
}
