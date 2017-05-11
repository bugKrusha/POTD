//
//  PhotoDisplayPresentationModel.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/7/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation
import SwiftyJSON

class PhotoDisplayPresentationModel {
    var delegate: PhotoDisplayPresentationModelDelegate?
    private let api = API()
    private let networkServiceProvider: NetworkServiceProvider = NetworkService()
    
    var today: Date
    let loadingText = "Loading..."
    
    init(today: Date) {
        self.today = today
        networkServiceProvider.delegate = self
    }
    
    func loadPODFor(date: Date) {
        delegate?.loading()
        let networkRequest = api.generateParameter(date: date)
        networkServiceProvider.load(networkRequest: networkRequest)
    }
}

extension PhotoDisplayPresentationModel: NetworkServiceConsumer {
    func failure(error: Error, statusCode: Int?) {
        print(error)
    }
    
    func success(value: Any) {
        let apod = Apod(json: JSON(value))
        delegate?.load(apod: apod)
    }
}
