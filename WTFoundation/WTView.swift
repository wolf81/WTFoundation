//
//  WTView.swift
//  WTFoundation
//
//  Created by Wolfgang Schreurs on 17/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

class WTView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let subviews = createSubviews()
        subviews.forEach { view in
            addSubview(view)
        }
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    
    func createSubviews() -> [UIView] {
        return []
    }
    
    func commonInit() {
    }
}

