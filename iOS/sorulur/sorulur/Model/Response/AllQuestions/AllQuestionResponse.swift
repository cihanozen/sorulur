//
//  AllQuestion.swift
//  sorulur
//
//  Created by Sinan Özman on 22.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import Alamofire

typealias AllQuestion = [AllQuestionElement]

class AllQuestionElement: Codable {
    let yaziID, yaziBaslik, yaziIcerik, yaziIcerikFull: String?
    let yaziEkleyenKadi, yaziTarih, neYazdi: String?
    let uyeAvatar: String?
    let katAdi: String?
    let sayErkek, sayKadin: Int?
    let soruResim: String?
    let cinsiyet: String?
    
    enum CodingKeys: String, CodingKey {
        case yaziID = "yazi_id"
        case yaziBaslik = "yazi_baslik"
        case yaziIcerik = "yazi_icerik"
        case yaziIcerikFull = "yazi_icerik_full"
        case yaziEkleyenKadi = "yazi_ekleyen_kadi"
        case yaziTarih = "yazi_tarih"
        case neYazdi = "ne_yazdi"
        case uyeAvatar = "uye_avatar"
        case katAdi = "kat_adi"
        case sayErkek = "say_erkek"
        case sayKadin = "say_kadin"
        case soruResim = "soru_resim"
        case cinsiyet
    }
    
    init(yaziID: String?, yaziBaslik: String?, yaziIcerik: String?, yaziIcerikFull: String?, yaziEkleyenKadi: String?, yaziTarih: String?, neYazdi: String?, uyeAvatar: String?, katAdi: String?, sayErkek: Int?, sayKadin: Int?, soruResim: String?, cinsiyet: String?) {
        self.yaziID = yaziID
        self.yaziBaslik = yaziBaslik
        self.yaziIcerik = yaziIcerik
        self.yaziIcerikFull = yaziIcerikFull
        self.yaziEkleyenKadi = yaziEkleyenKadi
        self.yaziTarih = yaziTarih
        self.neYazdi = neYazdi
        self.uyeAvatar = uyeAvatar
        self.katAdi = katAdi
        self.sayErkek = sayErkek
        self.sayKadin = sayKadin
        self.soruResim = soruResim
        self.cinsiyet = cinsiyet
    }
}

// MARK: Convenience initializers and mutators

extension AllQuestionElement {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AllQuestionElement.self, from: data)
        self.init(yaziID: me.yaziID, yaziBaslik: me.yaziBaslik, yaziIcerik: me.yaziIcerik, yaziIcerikFull: me.yaziIcerikFull, yaziEkleyenKadi: me.yaziEkleyenKadi, yaziTarih: me.yaziTarih, neYazdi: me.neYazdi, uyeAvatar: me.uyeAvatar, katAdi: me.katAdi, sayErkek: me.sayErkek, sayKadin: me.sayKadin, soruResim: me.soruResim, cinsiyet: me.cinsiyet)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        yaziID: String?? = nil,
        yaziBaslik: String?? = nil,
        yaziIcerik: String?? = nil,
        yaziIcerikFull: String?? = nil,
        yaziEkleyenKadi: String?? = nil,
        yaziTarih: String?? = nil,
        neYazdi: String?? = nil,
        uyeAvatar: String?? = nil,
        katAdi: String?? = nil,
        sayErkek: Int?? = nil,
        sayKadin: Int?? = nil,
        soruResim: String?? = nil,
        cinsiyet: String?? = nil
        ) -> AllQuestionElement {
        return AllQuestionElement(
            yaziID: yaziID ?? self.yaziID,
            yaziBaslik: yaziBaslik ?? self.yaziBaslik,
            yaziIcerik: yaziIcerik ?? self.yaziIcerik,
            yaziIcerikFull: yaziIcerikFull ?? self.yaziIcerikFull,
            yaziEkleyenKadi: yaziEkleyenKadi ?? self.yaziEkleyenKadi,
            yaziTarih: yaziTarih ?? self.yaziTarih,
            neYazdi: neYazdi ?? self.neYazdi,
            uyeAvatar: uyeAvatar ?? self.uyeAvatar,
            katAdi: katAdi ?? self.katAdi,
            sayErkek: sayErkek ?? self.sayErkek,
            sayKadin: sayKadin ?? self.sayKadin,
            soruResim: soruResim ?? self.soruResim,
            cinsiyet: cinsiyet ?? self.cinsiyet
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == AllQuestion.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AllQuestion.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

