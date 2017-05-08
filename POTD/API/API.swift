//
//  API.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/7/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation

struct API {
    private let API_KEY = "A39KoG0iaHbKO67U08qV6x0PUJHOzhQkmb9dBRdN"
    private let url = "https://api.nasa.gov/planetary/apod"
    
    /// Generate Network Request for call. Info
    /// on parameters can be found here https://api.nasa.gov/api.html#apod
    ///
    /// - Parameter date: Date for the request.
    /// - Returns: Parameters with api key and date.
    func generateParameter(date: Date) -> NetworkRequest {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var parameters = ["api_key": API_KEY]
        parameters["date"] = dateFormatter.string(from: date)

        return NetworkRequest(url: url, paramater: parameters)
    }
}
