//
//  ProjectConstants.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// appDelegate object
let appDelegate = UIApplication.shared.delegate as! AppDelegate

/// App Version
let APP_VERSION = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

// MARK: - URL

let URL_BASE = "https://www.sorulur.com/"
let URL_LOGIN = URL_BASE + "ios_uye_giris"
let URL_PROFILE_PICTURE = URL_BASE + "uploads/"

// MARK: - JSON DICTS

let DICT_KEY_LOGIN_EMAIL = "uye_eposta"
let DICT_KEY_LOGIN_PASSWORD = "uye_sifre"

// MARK: - ANIMATION SPEEDS

let ANIMATION_DEFAULT: TimeInterval = 0.3
let ANIMATION_DEFAULT_FASTER: TimeInterval = 0.2
let ANIMATION_DEFAULT_FASTEST: TimeInterval = 0.1

// MARK: - DEFAULT SIZE
let IS_SCREEN_480 = screenHeight() <= 480
let IS_SCREEN_568 = screenHeight() <= 568
let IS_SCREEN_667 = screenHeight() <= 667
let IS_SCREEN_736 = screenHeight() <= 736
let DEFAULT_MARGIN_X:CGFloat = 14
let HEIGHT_PICKER_COMPONENT:CGFloat = 260
let DEFAULT_TABBAR_SIZE:CGFloat = 49
let DEFAULT_NAVBAR_STATUS_SIZE:CGFloat = 64


let TEXT_KEY_PRIVACY = "Gizlilik & İzinler"
let TEXT_KEY_TERMS_OF_USE = "Kullanım Şartları"
let TEXT_KEY_TERMS_OF_REGISTER = "Üyelik Koşulları"
let TEXT_KEY_ERROR = "Hata"
let TEXT_KEY_INFO = "Bilgi"
let TEXT_KEY_WARN = "Uyarı"
let TEXT_KEY_OK = "Tamam"
let TEXT_KEY_CANCEL = "İptal"
let TEXT_KEY_CONFIRM = "Uygula"
let TEXT_KEY_INFO_VALID_PASS = "Lütfen geçerli şifre giriniz"
let TEXT_KEY_CLEAR = "Temizle"
let TEXT_KEY_FIRST_NAME = "AD"
let TEXT_KEY_LAST_NAME = "SOYAD"
let TEXT_KEY_ERROR_UNKNOWN = "Bir hata oluştu."
let TEXT_KEY_EDIT = "Düzenle"
let TEXT_KEY_DELETE = "Sil"
let TEXT_KEY_EXP_RESPONSIBILITIES = "İş Tanımı"
let TEXT_KEY_INFO_VALID_EMAIL = "Lütfen geçerli bir e-posta adresi giriniz"
let TEXT_KEY_INFO_EMPTY_EMAIL = "Lütfen e-posta adresi giriniz"
let TEXT_KEY_SIGN_IN = "Üye Girişi"
let TEXT_KEY_SIGN_IN_BIG = "ÜYE GİRİŞİ"
let TEXT_KEY_SIGN_UP = "ÜYE OL"
let TEXT_KEY_SIGN_UP_SMALL = "Üye Ol"
let TEXT_KEY_WELCOME_MORNING = "Günaydın"
let TEXT_KEY_WELCOME_HELLO = "Merhaba"
let TEXT_KEY_WELCOME_EVENING = "İyi akşamlar"
let TEXT_KEY_WELCOME_NIGHT = "İyi geceler"
let TEXT_KEY_WELCOME_MESSAGE = "İş bulmak için doğru yerdesin"
let TEXT_KEY_WELCOME_SEARCH_PLACEHOLDER = "Pozisyon ya da anahtar kelime ile ara"
let TEXT_KEY_WELCOME_REGISTER_TITLE = "Bir Dakikada İş Bul"
let TEXT_KEY_WELCOME_REGISTER_MESSAGE = "Yeteneklerine uygun yepyeni iş fırsatlarını yakalamak için"
let TEXT_KEY_LOGIN_EMAIL = "E-POSTA ADRESİ"
let TEXT_KEY_LOGIN_PASSWORD = "ŞİFRE"
let TEXT_KEY_LOGIN_FORGOT_PASS = "Şifremi Unuttum"
let TEXT_KEY_LOGIN_EMAIL_LOGIN = "GİRİŞ YAP"
let TEXT_KEY_LOGIN_EMAIL_LOGIN_SMALL = "Giriş Yap"
let TEXT_KEY_LOGIN_FACEBOOK_LOGIN = "FACEBOOK İLE GİRİŞ YAP"
let TEXT_KEY_LOGIN_REGISTER_TITLE = "Üye değil misin?"
let TEXT_KEY_OR = "veya"
let TEXT_KEY_SHARE = "Paylaş"
let TEXT_KEY_ERROR_LOGIN_FACEBOOK = "Facebook bağlantısı sırasında hata oluştu"
let TEXT_KEY_ERROR_LOGIN_FACEBOOK_FAIL = "Facebook ile bağlantı gerçekleştirilemedi"
let TEXT_KEY_ERROR_LOGIN_EMAIL_FAILED = "E-posta adresi ve/veya şifre yanlış"
let TEXT_KEY_REGISTER_CAMPAIGN = "İlgilenebileceğim kampanyalar ile ilgili e-posta almak istiyorum."
let TEXT_KEY_REGISTER_CONTRACT_1 = "Hesap oluşturarak "
let TEXT_KEY_REGISTER_CONTRACT_2 = "üyelik sözleşmesini"
let TEXT_KEY_REGISTER_CONTRACT_3 = " okuduğunuzu ve kabul ettiğinizi onaylıyorsunuz."
let TEXT_KEY_REGISTER_ALREADY_REGISTERED = "Zaten üye misin?"
let TEXT_KEY_ERROR_REGISTER_FAIL = "Üye olunurken bir hata oluştu"
let TEXT_KEY_INFO_EMPTY_NAME = "Lütfen isim giriniz"
let TEXT_KEY_INFO_EMPTY_SURNAME = "Lütfen soyisim giriniz"
let TEXT_KEY_ERROR_GET_USER_INFO = "Üyelik bilgileriniz alınırken bir hata oluştu"
let TEXT_KEY_FORGOT_PASS_TITLE = "Şifre sıfırlamak için hesabınıza ait e-posta adresini girin"
let TEXT_KEY_FORGOT_PASS_RESET = "ŞİFREMİ SIFIRLA"
let TEXT_KEY_FORGOT_PASS_RESULT_1 = " e-posta hesabına şifre sıfırlama bilgileri gönderildi.\n\n"
let TEXT_KEY_FORGOT_PASS_RESULT_2 = "E-posta adresindeki linke tıklayarak şifreni sıfırlayabilir, tekrar giriş yapabilirsin."
let TEXT_KEY_ERROR_FORGOT_PASS = " eposta adresi ile sistemimizde kayıtlı bir üyelik bulunmamaktadır."
let TEXT_KEY_SEARCH = "ARA"
let TEXT_KEY_PREVIOUS_SEARCH = "Kayıtlı Aramalarım"
let TEXT_KEY_KEYWORD = "ANAHTAR KELİME"
let TEXT_KEY_SEARCH_PLACEHOLDER = "Anahtar kelime giriniz"
let TEXT_KEY_SEARCH_POSITION_HEADER = "İlgili Pozisyonlar"
let TEXT_KEY_SEARCH_LOCATION_GET = "Konumunuz alınıyor"
let TEXT_KEY_SETTINGS = "Ayarlar"
let TEXT_KEY_LOCATION_ERROR_TITLE = "Konumunuz bulunamadı"
let TEXT_KEY_LOCATION_ERROR_MESSAGE = "Cihazınızın konum servisleri kapalı. Ayarlara gidip konum servislerini açık konuma getirebilirsin."
let TEXT_KEY_YES = "Evet"
let TEXT_KEY_NO = "Hayır"
let TEXT_KEY_ERROR_LOGOUT_FAIL = "Çıkış gerçekleştirilemedi"
let TEXT_KEY_ALL_ADVERTISEMENTS = "Tüm İlanlar"
let TEXT_KEY_FILTERS_SELECTED = " filtre seçili"
let TEXT_KEY_CELL_TITLE_KEYWORD = "Anahtar Kelime"
let TEXT_KEY_CELL_PLACEHOLDER_KEYWORD = "Pozisyon adı, anahtar kelime…"
let TEXT_KEY_CELL_TITLE_DATE = "İlan Tarihi"
let TEXT_KEY_CELL_TITLE_PREFERRED_SKILLS = "Aranan Nitelikler"
let TEXT_KEY_CELL_TITLE_PROPERTY_LIST = "Özet Bilgiler"
let TEXT_KEY_CELL_TITLE_SIMILAR_ADS = "Benzer İlanlar"
let TEXT_KEY_CELL_TITLE_CUSTOMER_ADS_FULL = "Firmanın Tüm İlanları"
let TEXT_KEY_CELL_SEE_SIMILAR_ADS = "Benzer İlanların Tümünü Gör"
let TEXT_KEY_CELL_TITLE_CUSTOMER_ADS = "Bu Firmanın Diğer İlanları"
let TEXT_KEY_CELL_SEE_CUSTOMER_ADS = "Firmanın Tüm İlanlarını Gör"
let TEXT_KEY_SEE_MORE = "Daha Fazla Göster"
let TEXT_KEY_SEE_LESS = "Daha Az Göster"
let TEXT_KEY_CV_SEEN = "Özgeçmişin Görüntülendi"
let TEXT_KEY_CV_ANSWERED = "Başvurun Cevaplandı"
let TEXT_KEY_APPLIED_DONE = "İş Başvurun Gerçekleşti"
let TEXT_KEY_AD_UNPUBLISHED = "Yayından Kaldırılmıştır"
let TEXT_KEY_ABORT = "Vazgeç"
let TEXT_KEY_NAME_SURNAME = "AD SOYAD"
let TEXT_KEY_EMAIL_BIG = "E-POSTA"
let TEXT_KEY_PHONE_BIG = "TELEFON"
let TEXT_KEY_REPORT_DESC = "ŞİKAYET AÇIKLAMASI"
let TEXT_KEY_INFO_EMPTY_NAME_SURNAME = "Lütfen isim soyisim giriniz"
let TEXT_KEY_INFO_EMPTY_PHONE = "Lütfen telefon giriniz"
let TEXT_KEY_INFO_EMPTY_DESC = "Lütfen açıklama giriniz"
let TEXT_KEY_FOLLOW_COMPANY = "Firmayı Takip Et"
let TEXT_KEY_COMPANY_FOLLOWED = "Firmayı Takipten Kaldır"
let TEXT_KEY_CELL_TITLE_COMPANY = "Şirket Bilgileri"
let TEXT_KEY_CELL_NO_COVER_LETTER = "Önyazı Kullanma"
let TEXT_KEY_PRIVACY_PERMISSION = "Gizlilik & İzinler"
let TEXT_KEY_REACH_US = "Bize Ulaş"
let TEXT_KEY_LOGOUT = "Çıkış Yap"
let TEXT_KEY_EMPTY_CELL = "EmptyCell"
let TEXT_KEY_COPYRIGHT = "Tüm hakları sakldır © 2017"
let TEXT_KEY_MESSAGES = "Mesajlarım"
let TEXT_KEY_COVER_LETTERS = "Ön Yazılarım"
let TEXT_KEY_WITHDRAW = "Geri Çek"
let TEXT_KEY_REACH_DESC = "AÇIKLAMA"
let TEXT_KEY_ENGLISH_CV = "＋  İngilizce Özgeçmiş Oluştur"
//let TEXT_KEY_ = ""
