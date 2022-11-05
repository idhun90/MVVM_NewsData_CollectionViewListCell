//
//  NewsViewController.swift
//  MVVM_NewsData_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import UIKit

enum Section {
    case main
}

final class NewsViewController: BaseViewController {
    
    private let mainView = NewsView()
    
    var viewModel = NewsViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, News.NewsItem>!
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        configureDataSource()
        
        // 초기화 그리고 리셋, 로드하기 위한 목적
        viewModel.newsSample.bind { [weak self] item in
            print("실행")
            var snapshot = NSDiffableDataSourceSnapshot<Section, News.NewsItem>()
            snapshot.appendSections([.main])
            snapshot.appendItems(item)
            self?.dataSource.apply(snapshot, animatingDifferences: true)
        }
        
        self.mainView.resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        self.mainView.loadButton.addTarget(self, action: #selector(load), for: .touchUpInside)
    }
    
    @objc private func reset() {
        viewModel.reset()
    }
    
    @objc private func load() {
        viewModel.load()
    }
    
    override func configureUI() {
        
    }
    
    private func setCollectionView() {
        self.mainView.collectionView.delegate = self
        self.mainView.collectionView.backgroundColor = .red
    }
}

extension NewsViewController {
    
    private func configureDataSource() {
        let cellReistration = UICollectionView.CellRegistration<UICollectionViewListCell, News.NewsItem> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.secondaryText = itemIdentifier.body
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: self.mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellReistration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
        // 스냅샷을 이 곳에 작성 시 초기화는 되지만, 추가 또는 리셋 버튼에 대한 반영이 되지 않는다. -> 주석처리
//        var snapshot = NSDiffableDataSourceSnapshot<Section, News.NewsItem>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(News.items)
//        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension NewsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}
