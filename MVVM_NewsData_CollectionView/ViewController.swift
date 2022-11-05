//
//  ViewController.swift
//  MVVM_NewsData_CollectionView
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    let resetButton: UIButton = {
        let view = UIButton()
        view.setTitle("reset", for: .normal)
        view.setTitleColor(.link, for: .normal)
        return view
    }()
    
    let loadButton: UIButton = {
        let view = UIButton()
        view.setTitle("load", for: .normal)
        view.setTitleColor(.link, for: .normal)
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [resetButton, loadButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
//    lazy var collectionView: UICollectionView = {
//        let createlayout = layout()
//        let view = UICollectionView(frame: .zero, collectionViewLayout: createlayout)
//        
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stackView)
        setupConstraints()
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.top.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(44)
        }
    }
    
//    func layout() -> UICollectionViewLayout {
//        
//    }


}

