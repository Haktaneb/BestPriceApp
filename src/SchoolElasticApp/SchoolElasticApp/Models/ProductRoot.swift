//
//  ProductRoot.swift
//  SchoolElasticApp
//
//  Created by haktan enes biçer on 29.12.2018.
//  Copyright © 2018 haktan enes biçer. All rights reserved.
//

import Foundation
struct ProductRoot : Decodable {

    private enum  CodingKeys: String, CodingKey { case resultCount ,pageCount , products = "results" }
    let resultCount : Int
    let pageCount : Int
    let products : [ElasticModel]
}
