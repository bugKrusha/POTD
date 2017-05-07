//
//  NetworkServiceConsumer.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/7/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceConsumer {
    func success(value: Any)
    func failure(error: Error, statusCode: Int?)
}
