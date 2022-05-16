//
//  NetworkingClient.swift
//  Harry Potter
//
//  Created by Tom Johnson on 16/05/2022.
//

import Foundation
import Alamofire

class NetworkingClient {
    
    typealias WebServiceResponse = ([Character]?, Error?) -> Void
    
    static func execute(_ url: URL, completion: @escaping WebServiceResponse) {
        
        AF.request(url).validate().response { response in
            
            guard let data = response.data else {
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode([Character].self, from: data)
                completion(result, nil)
            }
            catch {
                completion(nil, error)
            }
            
        }
    }
    
    static func executeImage(_ urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        AF.request(url!).validate().response { response in
            
            guard let data = response.data else {
                return
            }
            
            completion(data, nil)
        }
    }
}
