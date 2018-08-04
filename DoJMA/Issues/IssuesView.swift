//
//  IssuesView.swift
//  DoJMA
//
//  Created by Raghav Prasad on 02/08/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class IssuesView: UIView {
    
    var shouldSetupConstraints = true
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
