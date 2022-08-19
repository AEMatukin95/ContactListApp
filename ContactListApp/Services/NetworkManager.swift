//
//  NetworkManager.swift
//  ContactListApp
//
//  Created by Александр Матукин on 19.08.2022.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let urlParams = [
        "results":"\(15)",
    ]
    
    private init() {}
    
    func fetchUsers(_ completion: @escaping(Result<[User], AFError>) -> Void) {
        AF.request(URLConstants.randomUserAPI.rawValue, parameters: urlParams)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let user = User.getRandomUsers(from: value)
                    completion(.success(user))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func fetchData(from url: String, completion: @escaping (Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

