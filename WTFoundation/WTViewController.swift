//
//  WTViewController.swift
//  Lolcats
//
//  Created by Wolfgang Schreurs on 18/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

public enum WTViewState {
    case loading
    case error(Error)
    case loaded
}

open class WTViewController: UIViewController {
    // TODO: consider using an interface for loading view and error view to allow for more flexibility.
    
    public var contentView: UIView = {
        return UIView()
    }()
    
    public var loadingView: WTLoadingView = {
        return WTLoadingView()
    }()
    
    public var errorView: WTErrorView = {
        return WTErrorView()
    }()
    
    private(set) var viewState: WTViewState = .loaded {
        didSet {
            updateForViewState()
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.contentView)
        self.view.addSubview(self.loadingView)
        self.view.addSubview(self.errorView)
    }
    
    override open func viewWillLayoutSubviews() {
        let bounds = self.view.bounds
        
        self.contentView.frame = bounds
        self.loadingView.frame = bounds
        self.errorView.frame = bounds
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let initialState = loadData { endState in
            self.viewState = endState
        }
        
        self.viewState = initialState
    }

    // MARK: - Public
    
    open func loadData(completion: @escaping (WTViewState) -> Void) -> WTViewState {
        return .loaded
    }
    
    // MARK: - Private
    
    private func updateForViewState() {
        var updateBlock = {}
        
        switch self.viewState {
        case .error(let error):
            self.loadingView.stopActivity()
            
            self.errorView.configure(error: error)

            updateBlock = {
                self.loadingView.alpha = 0
                self.contentView.alpha = 0
                self.errorView.alpha = 1
            }
        case .loaded:
            self.loadingView.stopActivity()
            
            updateBlock = {
                self.loadingView.alpha = 0
                self.contentView.alpha = 1
                self.errorView.alpha = 0
            }
        case .loading:
            self.loadingView.startActivity()
            
            updateBlock = {
                self.loadingView.alpha = 1
                self.contentView.alpha = 0
                self.errorView.alpha = 0
            }
        }
        
        UIView.animate(withDuration: 0.5, animations: updateBlock)
    }
}
