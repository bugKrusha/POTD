//
//  NetworkServiceProvider.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/7/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceProvider: class {
    var delegate: NetworkServiceConsumer? { get set }
    func load(networkRequest: NetworkRequest)
}
