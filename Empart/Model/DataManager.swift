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
    
    private static var sharedDataManager: DataManager = {
        let dataManager = DataManager(musei: [Museo]())
        return dataManager
    }()
  
    private init(musei: [Museo]) {
        self.musei = musei
    }
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
}
