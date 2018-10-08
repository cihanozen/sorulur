//
//  LoginAPI.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

// MARK: - Alamofire response handlers

extension DataRequest {
    /// Response Decodable Mapping
    ///
    /// - Returns: DataResponseSerializer<T>
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, _, data, error in
            guard error == nil else { return .failure(error!) }

            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }

            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }

    /// response Decodable
    ///
    /// - Parameters:
    ///   - queue: DispatchQuque Optional
    ///   - completionHandler: Data Response Callback
    /// - Returns: Void Function
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }

    /// Login Response
    ///
    /// - Parameters:
    ///   - queue: DispatchQuque Optional
    ///   - completionHandler: LoginResponse Model Callback
    /// - Returns: Void Function
    @discardableResult
    func responseLogin(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<LoginResponse>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
