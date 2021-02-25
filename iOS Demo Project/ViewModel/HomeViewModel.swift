//
//  HomeViewModel.swift
//  iOS Demo Project
//
//  Created by Ahmer Hassan on 12/02/2021.
//  Copyright © 2021 Ahmer Hassan. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class HomeModelView {

    var fetchData = FetchData()
    weak var delegate: PassProductsData?
    func getAPIData()  {
        self.fetchData.getHomeProducts(resultType: ProductsResponse.self) { (response) in
            if let result = response {
                self.delegate?.passAPIData(result: result)
            }
        }
    }

}

class FetchData {
    
    func getHomeProducts<T:Codable>(resultType: T.Type, completionHandler: @escaping (_ data: T?)-> Void) {
        AF.request(URL(string: Utilities.url)!, method: .get).response {(response) in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    
                    completionHandler(result)
                    
                    
                } catch  {
                    print(error.localizedDescription)
                }
                
                
            }
            else {
                completionHandler(nil)
            }
            
        }
    }
    
    
}

protocol PassProductsData: AnyObject {
    func passAPIData(result: ProductsResponse?)
}








