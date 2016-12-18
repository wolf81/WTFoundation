//
//  LoadingView.swift
//  Lolcats
//
//  Created by Wolfgang Schreurs on 18/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

open class WTLoadingView: WTView {
    private let activityView = UIActivityIndicatorView()
    private let cancelButton = UIButton()
    
    override open func createSubviews() -> [UIView] {
        return [self.activityView, self.cancelButton]
    }
    
    override open func commonInit() {
        super.commonInit()
        
        self.activityView.color = .black
        self.activityView.hidesWhenStopped = true
        
        self.cancelButton.setTitle("Cancel", for: .normal)
        self.cancelButton.setTitleColor(.black, for: .normal)
        self.cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = self.bounds
        let margin: CGFloat = 20.0
        
        let activityWidth: CGFloat = 40.0
        let activityHeight = activityWidth
        let activityX = (bounds.size.width - activityWidth) / 2
        let activityY = bounds.midY - activityHeight - (margin / 2)
        self.activityView.frame = CGRect(x: activityX, y: activityY, width: activityWidth, height: activityHeight).integral

        let buttonSize = self.cancelButton.sizeThatFits(bounds.size)
        let buttonX = (bounds.width - buttonSize.width) / 2
        let buttonY = self.activityView.frame.maxY + margin
        self.cancelButton.frame = CGRect(x: buttonX, y: buttonY, width: buttonSize.width, height: buttonSize.height).integral
    }
    
    // MARK: - Public
    
    public func startActivity() {
        self.activityView.startAnimating()
    }
    
    public func stopActivity() {
        self.activityView.stopAnimating()
    }
}
