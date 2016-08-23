//
//  YandexServiceApi.swift
//  YandexTranslateApp
//
//  Created by Anna Gorobchenko on 22.08.16.
//  Copyright © 2016 Anna Gorobchenko. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class YandexServiceApi {
    
    var request: Alamofire.Request?
    private var alamoFireManager : Alamofire.Manager!
    
    func sendRequestText (text : String, completionHandler: (Bool, [TranslationListModel]) -> ()) {
        
        let parameters = [
            "key": "dict.1.1.20160821T174005Z.9886aeaf3eba898f.06a3fa5e0f9d05c6d89934daae85402ce77a326c",
            "lang": "en-ru",
            "text": text ]
        
        var translationData = [TranslationListModel]()
        
      
        
        self.request = Alamofire.request(.POST, "https://dictionary.yandex.net/api/v1/dicservice.json/lookup", parameters: parameters)
            .responseObject{ (response: Response<TranslationResponseModel, NSError>) in
            if let td = response.result.value?.def {
                translationData = td
                completionHandler(true, translationData)
            } else {
                completionHandler(false, translationData)
                
                }
        }
    }
    
    func cancelRequest () {
        
        self.request?.cancel()
       
        //Alamofire.Manager.sharedInstance.session.invalidateAndCancel()
    }
    
}
