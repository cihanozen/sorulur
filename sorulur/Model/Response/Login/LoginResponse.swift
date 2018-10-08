//
//  Login.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let login = try Login(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseLogin { response in
//     if let login = response.result.value {
//       ...
//     }
//   }

import Alamofire
import Foundation

/// LoginResponse
/// ### Usage Example: ###
/// ````
/// Alamofire.request(url).responseLogin { response in
///    if let login = response.result.value {
///        ...
///    }
/// }
/// ````
class LoginResponse: Codable {
    /// Response Variables
    let uyeAvatar, uyeDurum, uyeEposta, uyeID: String
    let uyeKadi, uyePuan, uyeSifre: String

    /// Coding Keys for json data
    ///
    /// - uyeAvatar: json response userImage Key
    /// - uyeDurum: json response UserStatus Key
    /// - uyeEposta: json response UserEmail Key
    /// - uyeID: json response UserID Key
    /// - uyeKadi: json response UserNick Key
    /// - uyePuan: json response UserPoint Key
    /// - uyeSifre: json response UserPassword Key
    enum CodingKeys: String, CodingKey {
        case uyeAvatar = "uye_avatar"
        case uyeDurum = "uye_durum"
        case uyeEposta = "uye_eposta"
        case uyeID = "uye_id"
        case uyeKadi = "uye_kadi"
        case uyePuan = "uye_puan"
        case uyeSifre = "uye_sifre"
    }

    /// Login Response İnit
    ///
    /// - Parameters:
    ///   - uyeAvatar: user Image Path String
    ///   - uyeDurum: user Status value in String
    ///   - uyeEposta: user Email value in String
    ///   - uyeID: user Id value in String
    ///   - uyeKadi: user Nick Value in String
    ///   - uyePuan: user point value in String
    ///   - uyeSifre: user password value in String
    ///    ### Usage Example: ###
    ///    ````
    ///    LoginResponse(uyeAvatar: String, uyeDurum: String, uyeEposta: String, uyeID: String, uyeKadi: String, uyePuan: String, uyeSifre: String)
    ///    ````
    init(uyeAvatar: String, uyeDurum: String, uyeEposta: String, uyeID: String, uyeKadi: String, uyePuan: String, uyeSifre: String) {
        self.uyeAvatar = uyeAvatar
        self.uyeDurum = uyeDurum
        self.uyeEposta = uyeEposta
        self.uyeID = uyeID
        self.uyeKadi = uyeKadi
        self.uyePuan = uyePuan
        self.uyeSifre = uyeSifre
    }
}

// MARK: Convenience initializers and mutators

// MARK: - LoginResponse Extensions for data

extension LoginResponse {
    /// init data decode and init LoginResponse class variables
    ///
    /// - Parameter data: api response in data
    /// - Throws: LoginResponse Class init
    ///    ### Usage Example: ###
    ///    ````
    ///    LoginResponse(Data)
    ///    ````
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(LoginResponse.self, from: data)
        self.init(uyeAvatar: me.uyeAvatar, uyeDurum: me.uyeDurum, uyeEposta: me.uyeEposta, uyeID: me.uyeID, uyeKadi: me.uyeKadi, uyePuan: me.uyePuan, uyeSifre: me.uyeSifre)
    }

    /// init json decode and init LoginResponse class variable
    ///
    /// - Parameters:
    ///   - json: api response in json
    ///   - encoding: encoding format
    /// - Throws: LoginResponse Class init
    ///    ### Usage Example: ###
    ///    ````
    ///    let json = "{'exampleKey':'exampleValue'}"
    ///    LoginResponse(json,encoding: String.Encoding = .utf8)
    ///    ````
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    /// init Url for data
    ///
    /// - Parameter url: url
    /// - Throws: LoginResponse Class init
    ///    ### Usage Example: ###
    ///    ````
    ///    let url: URL = "http://www.example.com" as! URL
    ///    LoginResponse(url: url)
    ///    ````
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    /// with Functions
    ///
    /// - Parameters:
    ///   - uyeAvatar: String User Image
    ///   - uyeDurum: String User Status
    ///   - uyeEposta: String User Email
    ///   - uyeID: String User Id
    ///   - uyeKadi: String User Nick
    ///   - uyePuan: String User Point
    ///   - uyeSifre: String User Password
    /// - Returns: LoginResponse Object
    func with(
        uyeAvatar: String? = nil,
        uyeDurum: String? = nil,
        uyeEposta: String? = nil,
        uyeID: String? = nil,
        uyeKadi: String? = nil,
        uyePuan: String? = nil,
        uyeSifre: String? = nil
    ) -> LoginResponse {
        return LoginResponse(
            uyeAvatar: uyeAvatar ?? self.uyeAvatar,
            uyeDurum: uyeDurum ?? self.uyeDurum,
            uyeEposta: uyeEposta ?? self.uyeEposta,
            uyeID: uyeID ?? self.uyeID,
            uyeKadi: uyeKadi ?? self.uyeKadi,
            uyePuan: uyePuan ?? self.uyePuan,
            uyeSifre: uyeSifre ?? self.uyeSifre
        )
    }

    /// data convert to json
    ///
    /// - Returns: parsed Data
    /// - Throws: LoginResponse Class init
    ///    ### Usage Example: ###
    ///    ````
    ///    let data = [String:Any]
    ///    LoginResponse(data).jsonData()
    ///    ````
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    /// json parse to string
    ///
    /// - Parameter encoding: encoding format
    /// - Returns: String
    /// - Throws: LoginResponse Class init
    ///    ### Usage Example: ###
    ///    ````
    ///    let json = "example"
    ///    LoginResponse(json,encoding: String.Encoding = .utf8).jsonString()
    ///    ````
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}
