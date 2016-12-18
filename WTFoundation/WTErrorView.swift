//
//  ErrorView.swift
//  Lolcats
//
//  Created by Wolfgang Schreurs on 18/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

class WTErrorView: WTView {
    let errorLabel = UILabel()
    let reloadButton = UIButton()
    
    override func createSubviews() -> [UIView] {
        return [self.errorLabel, self.reloadButton]
    }
    
    override func commonInit() {
        super.commonInit()
        
        self.errorLabel.textColor = .black
        self.errorLabel.textAlignment = .center
        
        self.reloadButton.setTitle("Reload", for: .normal)
        self.reloadButton.setTitleColor(.black, for: .normal)
        self.reloadButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = self.bounds
        let margin: CGFloat = 20.0
        
        let maxWidth = bounds.width - (margin * 2)
        let constraint = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        
        let labelSize = self.errorLabel.sizeThatFits(constraint)
        let labelY = bounds.midY - labelSize.height - (margin / 2)
        self.errorLabel.frame = CGRect(x: margin, y: labelY, width: maxWidth, height: labelSize.height).integral
        
        let buttonY = self.errorLabel.frame.maxY + margin
        let buttonSize = self.reloadButton.sizeThatFits(constraint)
        self.reloadButton.frame = CGRect(x: margin, y: buttonY, width: maxWidth, height: buttonSize.height).integral
    }
    
    // MARK: - Public
    
    public func configure(error: Error) {
        self.errorLabel.text = error.localizedDescription
        setNeedsLayout()
    }
}
