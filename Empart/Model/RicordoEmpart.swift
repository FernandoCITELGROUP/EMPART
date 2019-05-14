//
//  RicordoEmpart.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class RicordoEmpart{
    var videoGenerato:URL
    var esperienza:EsperienzaEmpart
    
    init() {
        self.videoGenerato = URL(fileURLWithPath: "")
        self.esperienza = EsperienzaEmpart()
    }
    
    init(esperienza:EsperienzaEmpart, nomeVideoGenerato:String) {
        self.videoGenerato =  RicordoEmpart.getWhistleURL(nomeFile: nomeVideoGenerato)
        self.esperienza = esperienza
    }
    
    init(esperienza:EsperienzaEmpart, urlVideoGenerato:URL) {
        self.videoGenerato =  urlVideoGenerato
        self.esperienza = esperienza
    }
    
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    class func getWhistleURL(nomeFile:String) -> URL {
        return getDocumentsDirectory().appendingPathComponent("\(nomeFile)")
    }
}
