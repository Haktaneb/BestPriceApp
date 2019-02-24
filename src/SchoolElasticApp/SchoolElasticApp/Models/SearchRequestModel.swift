//
//  SearchRequestModel.swift
//  SchoolElasticApp
//
//  Created by haktan enes biçer on 29.12.2018.
//  Copyright © 2018 haktan enes biçer. All rights reserved.
//

import Foundation
class SearchRequestModel :Codable {
    var searchTerm = ""
    var pageSize = 0
    var pageNumber = 0
}
