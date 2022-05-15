//
//  APIService.swift
//  Harry Potter
//
//  Created by Tom Johnson on 15/05/2022.
//

import Foundation

struct APIService {
    
    let urlString: String
        
    func getJSON<T: Decodable>(dateDecodingStratergy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStratergy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStratergy
            decoder.keyDecodingStrategy = keyDecodingStratergy
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            }
            catch {
                throw APIError.decodingError(error.localizedDescription)
            }
        }
        catch {
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case dataTaskError(String)
    case corruptData
    case decodingError(String)
    
    var errorDescription: String? {
        
        switch self {
        case .invalidURL:
            return NSLocalizedString("The endpoint URL is invalid", comment: "")
        case .invalidResponse:
            return NSLocalizedString("The APIO failed to issue a valid response", comment: "")
        case .dataTaskError(let string):
            return string
        case .corruptData:
            return NSLocalizedString("The data provided appears to be corrupt", comment: "")
        case .decodingError(let string):
            return string
        }
    }
}
