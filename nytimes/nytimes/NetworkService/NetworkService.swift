//
//  NetworkService.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit
import Alamofire

typealias ArticlesList = Result<Items, String>

enum Result<Value, Error> {
    case success(Value)
    case failure(Error)
}

protocol NetworkServiceProtocol: class {
    func getArticles(url: String, completion: @escaping (ArticlesList) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getArticles(url: String, completion: @escaping (ArticlesList) -> Void) {
        
        let parameters: Parameters = ["api-key": Constants.Api.apiKey]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success:
                do {
                    guard let json = response.result.value else { return completion(.failure("Response is nil")) }
                    let data = try JSONSerialization.data(withJSONObject: json, options: [])
                    let array = try JSONDecoder().decode(Items.self, from: data)
                    completion(.success(array))
                } catch {
                    completion(.failure(error.localizedDescription))
                }
            case .failure(let error):
                completion(.failure(error.localizedDescription))
            }
        }
    }
    
}
