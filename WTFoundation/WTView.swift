//
//  WTView.swift
//  WTFoundation
//
//  Created by Wolfgang Schreurs on 17/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

open class WTView : UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     
        commonInit()
    }
    
    open func createSubviews() -> [UIView] {
        return []
    }
    
    open func commonInit() {
        self.backgroundColor = .white
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        let subviews = createSubviews()
        subviews.forEach { view in
            addSubview(view)
        }
    }
}

