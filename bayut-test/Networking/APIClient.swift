//
//  APIClient.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import Foundation
import Alamofire

class APIClient {
    
    private static var headers: HTTPHeaders {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    private class func getUrl(withEndpoint endpoint: String) -> String {
        return "\(Environment.baseURL)/\(endpoint)"
    }
    
    //MARK:- Generic Responses
    class func getValue<T:Decodable>(parameter: Parameters?, endPoint: String, callback:@escaping (_ value: T?, _ error: Error?)->Void) {
        
        let url = APIClient.getUrl(withEndpoint: endPoint)
        AF.request(url, parameters: parameter, encoding: URLEncoding.queryString, headers: headers).responseJSON { (response) in
            var value: T?
            var err: Error?
            
            switch(response.result) {
            case .success(_):
                do {
                    guard let data = response.data else { return }
                    value = try JSONDecoder().decode(T.self, from: data)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                err = error
            }
            callback(value, err)
        }
    }
    
    //MARK:- HOME
    class func fetchProducts(callback:@escaping (_ productResult: ProductResult?, _ error: Error?)->Void) {
        let endPoint = "dynamodb-writer"
        getValue(parameter: nil, endPoint: endPoint, callback: callback)
    }
}
