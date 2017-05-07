//
//  API.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/7/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation

struct API {
    private let API_KEY = ""
    private let url = "https://api.nasa.gov/planetary/apod"
    
    func generateParameter(date: Date) -> NetworkRequest {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var parameters = ["api_key": API_KEY]
        parameters["date"] = dateFormatter.string(from: date)
        
        print(parameters)
        return NetworkRequest(url: url, paramater: parameters)
    }
}
