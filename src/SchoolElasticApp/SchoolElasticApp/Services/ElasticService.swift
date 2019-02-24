//
//  ElasticService.swift
//  SchoolElasticApp
//
//  Created by haktan enes biçer on 29.12.2018.
//  Copyright © 2018 haktan enes biçer. All rights reserved.
//

import Foundation
import Alamofire
class ElasticService {

    static func PostAlomofire(format : SearchRequestModel,completion:@escaping(()-> Void))  {
        let loginParam: [String: Any] = [
            "searchTerm": format.searchTerm,
            "pageSize": format.pageSize,
            "pageNumber": format.pageNumber
        ]
        
        AF.request("http://10.3.4.27:32771/api/Values/Search", method: .post, parameters: loginParam , encoding: JSONEncoding.prettyPrinted)
            .responseJSON { response in
                let json = response.data
                print(json)
                let jsonString = String(data: json!, encoding: .utf8);
                print("JSON: \(jsonString)")
                do{
                    let decoder = JSONDecoder()
                    //using the array to put values
                    let result = try decoder.decode(ProductRoot.self, from: json!)
                    Common.Products = result.products
                    completion()

                }catch let err{
                    print(err)
                }

        }
    }
    static func SaveProduct(format : ElasticModel,completion:@escaping(()-> Void))  {
        let loginParam: [String: Any] = [
            "storeName": format.storeName,
            "itemName": format.itemName,
            "itemPrice":format.itemPrice,
            "id": "a53716a7-6833-472c-81a4-9be8bb3295b5",
            "date": "2018-12-29T21:44:28.509Z",
            "address" : format.address
        ]
        print(loginParam)
        AF.request("http://10.3.4.27:32771/api/Values/AddItem", method: .post, parameters: loginParam , encoding: JSONEncoding.default)
            .responseString { response in
                let result = response.result
                print(result)
                switch response.result {
                case .success:
                    print("Validation Successful")
                    Common.updateSucces=true
                    completion()

                case .failure(let error):
                    Common.updateSucces = false
                    print(error)
                }

        }
        print("12")
    }
}

