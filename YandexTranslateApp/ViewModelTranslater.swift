

import Foundation
import UIKit
import RxSwift

class ViewModelTranslater {
    
    var translatedText: Variable <String> = Variable( "" )
    
    private var yandexServiceApi = YandexServiceApi()
    var isAnimating : Variable <Bool> = Variable( false )
    
    // var textChangedObservable: Observable<String>?
    
    private var previous = ""
    
    
    func changedText(text : String) {
        
        self.isAnimating.value =  true
        
        self.yandexServiceApi.sendRequestText(text){
            [weak self] data in
            let translationListModel = data.1
            
            if  let value = translationListModel.first {
                
                self!.translatedText.value = (value.tr?.first?.text)!
                
                
                self?.isAnimating.value =  false
                
            }
            
            
            /*self!.textChangedObservable!
             
             .filter { (textToTranslate : String) -> Bool in
             textToTranslate.characters.count == 0
             self!.isAnimating.value = false
             self!.translatedText.value = ""
             return true
             }
             /*
             .filter { (textToTranslate : String) -> Bool in
             self!.previous != textToTranslate
             self!.isAnimating.value = false
             self!.translatedText.value =  "Error, smth wrong"
             return true
             }
             */
             
             .subscribeNext { (textToTranslate) in
             self!.translatedText.value = text
             
             
             }
             
             }
             
             */
            
        }
    }
}
