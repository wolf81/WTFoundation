//
//  WTTableViewCell.swift
//  WTFoundation
//
//  Created by Wolfgang Schreurs on 18/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

open class WTTableViewCell: UITableViewCell {
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        let subviews = createSubviews()
        subviews.forEach { view in
            addSubview(view)
        }
    }
}
