//
//  BaseViewController.swift
//  MVVM_NewsData_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupLayout()
    }
    
    func configureUI() { }
    func setupLayout() { }
}
