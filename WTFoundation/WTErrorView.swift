//
//  ErrorView.swift
//  Lolcats
//
//  Created by Wolfgang Schreurs on 18/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

public protocol WTErrorViewDelegate: class {
    func errorViewReloadAction(view: WTErrorView)
}

fileprivate extension Selector {
    static let reloadButtonTouchedUpInside = #selector(WTErrorView.reloadButtonTouchUpInside(_:))
}

open class WTErrorView: WTView {
    private var errorLabel = UILabel()
    private var reloadButton = UIButton()
    
    weak open var delegate: WTErrorViewDelegate?

    override open func createSubviews() -> [UIView] {
        return [self.errorLabel, self.reloadButton]
    }
    
    override open func commonInit() {
        super.commonInit()
        
        self.errorLabel.textColor = .black
        self.errorLabel.textAlignment = .center
        
        self.reloadButton.setTitle("Reload", for: .normal)
        self.reloadButton.setTitleColor(.black, for: .normal)
        self.reloadButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.reloadButton.addTarget(self, action: .reloadButtonTouchedUpInside, for: .touchUpInside)
    }
    
    // MARK: - Layout
    
    override open func layoutSubviews() {
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
    
    open func configure(error: Error) {
        self.errorLabel.text = error.localizedDescription
        setNeedsLayout()
    }
    
    // MARK: - Private
    
    @objc fileprivate func reloadButtonTouchUpInside(_: UIButton) {
        self.delegate?.errorViewReloadAction(view: self)
    }
}
