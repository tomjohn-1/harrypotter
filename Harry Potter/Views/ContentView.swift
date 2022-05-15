//
//  ContentView.swift
//  Harry Potter
//
//  Created by Tom Johnson on 12/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = CharactersModel()
    @State var infoShowing = false
    @State var characterToShow: Character?
    
    var body: some View {
        
        ScrollView {
            LazyVStack (alignment: .leading) {
                
                Button {
                    vm.filterCharacters(house: "Gryffindor")
                } label: {
                    Text("Filter")
                        .font(.title)
                }

                
                ForEach(0..<vm.filteredCharacters.count, id: \.self) { i in
                    
                    Button {
                        characterToShow = vm.characters[i]
                        infoShowing = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: 100)
                            
                            HStack {
                                Text(vm.filteredCharacters[i].name)
                                    .foregroundColor(.black)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                    Divider()
                    
                }
                
            }
        }
        .task {
            await vm.getData()
            if !vm.characters.isEmpty {
                characterToShow = vm.characters[0]
            }
        }
        .sheet(isPresented: $infoShowing) {
            
        } content: {
            InfoView(character: characterToShow!)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
