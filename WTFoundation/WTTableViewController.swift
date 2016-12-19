//
//  WTTableViewController.swift
//  Lolcats
//
//  Created by Wolfgang Schreurs on 19/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit

open class WTTableViewController: WTViewController {
    open var tableView: UITableView
    
    override init() {
        self.tableView = UITableView()

        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.tableView = UITableView()

        super.init(coder: aDecoder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        self.contentView.addSubview(self.tableView)
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.tableView.frame = self.contentView.bounds
    }
}

extension WTTableViewController: UITableViewDelegate {
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension WTTableViewController: UITableViewDataSource {
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
