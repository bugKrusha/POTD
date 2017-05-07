//
//  PhotoDisplayPresentationModel.swift
//  POTD
//
//  Created by Jon-Tait Beason on 5/7/17.
//  Copyright © 2017 Jon-Tait Beason. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol PhotoDisplayPresentationModelDelegate  {
    func load(apod: Apod)
}

struct PhotoDisplayPresentationModel {
    var delegate: PhotoDisplayPresentationModelDelegate?
    private let api = API()
    private let networkServiceProvider: NetworkServiceProvider = NetworkService()
    
    var date: Date
    
    init(date: Date) {
        self.date = date
        networkServiceProvider.delegate = self
        loadPODFor(date: date)
    }
    
    func loadPODFor(date: Date) {
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
