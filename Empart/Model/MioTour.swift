//
//  MioTour.swift
//  Empart
//
//  Created by fernando rosa on 07/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import Foundation

class MioTour: TourEmpart{
    var data:Date
    var tappeVissute:[MiaTappa]
    
    override init() {
        self.data = Date()
        self.tappeVissute = [MiaTappa]()
        super.init()
    }
}
