//
//  Pulsing.swift
//  Empart
//
//  Created by fernando rosa on 09/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class Pulsing: CALayer {
    var animationGroup = CAAnimationGroup()
    var initialPulsScale: Float = 0
    var nextPulseAfter:TimeInterval = 0
    var animationDUration:TimeInterval = 1.5
    var radius: CGFloat = 200
    var numberOfPulse:Float = Float.infinity
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(numberOfPulse:Float = Float.infinity, radius:CGFloat, position:CGPoint){
        super.init()
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        
    
    }
    
    
    
}
