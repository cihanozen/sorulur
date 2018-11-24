//
//  AllQuestion.swift
//  sorulur
//
//  Created by Sinan Özman on 22.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseAllQuestion(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<AllQuestion>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
