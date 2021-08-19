//
//  ViewController.swift
//  InjectionSwiftExample
//
//  Created by DragonLi on 19/8/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testView()
    }

    fileprivate func testView() {
        let testView = UIView()
        testView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        testView.backgroundColor = .yellow
        view.addSubview(testView)
    }
    
    
}

