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
    
}
