//
//  NetworkService.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/7/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService: NetworkServiceProvider {
    var delegate: NetworkServiceConsumer?
    
    func load(url: URL, paramters: [String: Any]) {
        Alamofire.request(url, parameters: paramters)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            switch response.result {
            case let .success(value):
                self.delegate?.success(value: value)
            case let .failure(error):
                self.delegate?.failure(error: error, statusCode: response.response?.statusCode)
            }
        }
    }
}
