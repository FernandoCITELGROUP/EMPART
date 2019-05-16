//
//  DataManager.swift
//  Empart
//
//  Created by fernando rosa on 09/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class DataManager{
    var musei:[Museo]
    var emozioni:[Emozione]
    var esperienza:EsperienzaEmpart
    var mieiTour:[MioTour]
    var opzioneMusicaScelta:Int
    var opzioneHeartScelta:Int
    var trackedImage:String
    
    private static var sharedDataManager: DataManager = {
        let dataManager = DataManager(musei: [Museo](), emozioni: [Emozione](), mieiTour:[MioTour]())
        return dataManager
    }()
  
    private init(musei: [Museo], emozioni:[Emozione], mieiTour:[MioTour]) {
        self.musei = musei
        self.emozioni = emozioni
        self.esperienza = EsperienzaEmpart()
        self.mieiTour = mieiTour
        self.opzioneMusicaScelta = 2
        self.trackedImage = ""
        self.opzioneHeartScelta = 2
    }
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
}
