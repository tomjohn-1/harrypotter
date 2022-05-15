//
//  CharactersModel.swift
//  Harry Potter
//
//  Created by Tom Johnson on 15/05/2022.
//

import Foundation

class CharactersModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var errorMessage: String?
    
    init() {
        getHPData()
    }
    
    @MainActor
    func getData() async {
        
        let url = "http://hp-api.herokuapp.com/api/characters"
        
        let apiService = APIService(urlString: url)
        
        do {
            self.characters = try await apiService.getJSON()
            print(characters[0].name)
        }
        catch {
            self.errorMessage = error.localizedDescription
            print(errorMessage)
        }
    }
    
    func getHPData() {
        
        let urlString = "http://hp-api.herokuapp.com/api/characters"
        
        let url = URL(string: urlString)
        
        print(url)
        
        guard url != nil else {
            return
        }
        
        let request = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil, data != nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Character].self, from: data!)
                
                DispatchQueue.main.async {
                    self.characters = result
                }
                
            }
            catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
