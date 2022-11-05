//
//  NewsViewModel.swift
//  MVVM_NewsData_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import Foundation

class NewsViewModel {
    
    var newsSample: Observable<[News.NewsItem]> = Observable(News.items)
    
    func reset() {
        newsSample.value = []
    }
    
    func load() {
        newsSample.value = News.items
    }
    
}
