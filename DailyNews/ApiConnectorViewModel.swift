//
//  ApiConnectorViewModel.swift
//  DailyNews
//
//  Created by mac on 2022-08-20.
//

import Foundation

struct APIStructure: Codable {
    var totalResults:Int
    var articles: [article]
}

struct article:Codable,Hashable {
    var author:String?
    var title: String?
    var description: String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
}



