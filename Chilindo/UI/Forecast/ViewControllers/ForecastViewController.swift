//
//  ForecastViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//


import UIKit

class ForecastViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
    }
    
    func setTitle(){
        navigationItem.title = "ForeCast"
    }
}