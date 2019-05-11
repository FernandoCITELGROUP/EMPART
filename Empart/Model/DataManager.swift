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
    
    private static var sharedDataManager: DataManager = {
        let dataManager = DataManager(musei: [Museo](), emozioni: [Emozione]())
        return dataManager
    }()
  
    private init(musei: [Museo], emozioni:[Emozione]) {
        self.musei = musei
        self.emozioni = emozioni
        self.esperienza = EsperienzaEmpart()
    }
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
}
