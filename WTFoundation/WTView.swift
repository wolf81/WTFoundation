//
//  WTView.swift
//  WTFoundation
//
//  Created by Wolfgang Schreurs on 17/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

public class WTView : UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        let subviews = createSubviews()
        subviews.forEach { view in
            addSubview(view)
        }
        
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    
    public func createSubviews() -> [UIView] {
        return []
    }
    
    public func commonInit() {
    }
}

