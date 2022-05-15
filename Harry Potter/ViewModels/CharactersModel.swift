//
//  CharactersModel.swift
//  Harry Potter
//
//  Created by Tom Johnson on 15/05/2022.
//

import Foundation

class CharactersModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var filteredCharacters: [Character] = []
    @Published var errorMessage: String?
    
    @Published var houseSelection: Houses = .All
    @Published var statusSelection: Status = .All
    
    init() {
//        getHPData()
    }
    
    @MainActor
    func getData() async {
        
        let url = "http://hp-api.herokuapp.com/api/characters"
        
        let apiService = APIService(urlString: url)
        
        do {
            self.characters = try await apiService.getJSON()
            
            self.characters.sort { c1, c2 in
                return c1.name < c2.name
            }
            
            self.filteredCharacters = self.characters
        }
        catch {
            self.errorMessage = error.localizedDescription
            print(errorMessage)
        }
    }
    
    func filterCharactersByStaff() {
        
        self.filteredCharacters = self.filteredCharacters.filter({ character in
            character.hogwartsStaff == true
        })
        
    }
    
    func filterCharactersByStudent() {
        
        self.filteredCharacters = self.filteredCharacters.filter({ character in
            character.hogwartsStudent == true
        })
        
    }
    
    func filterCharactersByNeither() {
        
        self.filteredCharacters = self.filteredCharacters.filter({ character in
            character.hogwartsStaff == false && character.hogwartsStudent == false
        })
        
    }
    
    func filterCharactersByHouse(house: String) {
        
        if house == "All" {
            return
        }
        
        self.filteredCharacters = self.filteredCharacters.filter({ character in
            character.house == house
        })
    }
    
    func clearFilters() {
        self.filteredCharacters = self.characters
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
//
            }
            catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
