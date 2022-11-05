//
//  NewsView.swift
//  MVVM_NewsData_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import UIKit

import SnapKit

class NewsView: BaseView {
    
    let resetButton: UIButton = {
        var configuraiton = UIButton.Configuration.filled()
        configuraiton.title = "reset"
        let view = UIButton(configuration: configuraiton)
        return view
    }()
    
    let loadButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "load"
        let view = UIButton(configuration: configuration)
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [resetButton, loadButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let createdlayout = createdlayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: createdlayout)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func configureUI() {
        self.backgroundColor = .white
    }
    
    override func setupLayout() {
        [stackView, collectionView].forEach {
            self.addSubview($0)
        }
        
        let spacing = 20
        
        stackView.snp.makeConstraints {
            let height = 44
            $0.top.leading.equalTo(self.safeAreaLayoutGuide).offset(spacing)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-spacing)
            $0.height.equalTo(height)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(spacing)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}

extension NewsView {
    private func createdlayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}
