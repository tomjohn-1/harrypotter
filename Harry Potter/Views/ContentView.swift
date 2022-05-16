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
            if vm.isLoading {
                ProgressView()
            }
            else {
                LazyVStack (alignment: .leading) {
                    
                    HStack (spacing: 20) {
                        
                        Picker(selection: $vm.houseSelection) {
                            Text("All")
                                .tag(Houses.All)
                            Text("Gryffindor")
                                .tag(Houses.Gryffindor)
                            Text("Slytherin")
                                .tag(Houses.Slytherin)
                            Text("Hufflepuff")
                                .tag(Houses.Hufflepuff)
                            Text("Ravenclaw")
                                .tag(Houses.Ravenclaw)
                        } label: {
                            Text("House Picker")
                        }
                        
                        Divider()

                        Picker(selection: $vm.statusSelection) {
                            Text("All")
                                .tag(Status.All)
                            Text("Student")
                                .tag(Status.Student)
                            Text("Staff")
                                .tag(Status.Staff)
                            Text("Neither")
                                .tag(Status.Neither)
                        } label: {
                            Text("Status Picker")
                        }
                        .font(.title)
                        
                        Divider()
                        
                        Button {
                            if vm.statusSelection == Status.Student {
                                vm.filterCharactersByStudent()
                            }
                            else if vm.statusSelection == Status.Staff {
                                vm.filterCharactersByStaff()
                            }
                            else if vm.statusSelection == Status.Neither {
                                vm.filterCharactersByNeither()
                            }
                            
                            vm.filterCharactersByHouse(house: vm.houseSelection.rawValue)
                        } label: {
                            Text("Filter")
                                .font(.title3)
                        }
                        
                        Divider()
                        
                        Button {
                            vm.clearFilters()
                            vm.houseSelection = .All
                            vm.statusSelection = .All
                        } label: {
                            Text("Clear")
                                .font(.title3)
                        }
                    }
                    .foregroundColor(.black)
                    .padding()
                    
                    ForEach(0..<vm.filteredCharacters.count, id: \.self) { i in
                        
                        Button {
                            characterToShow = vm.filteredCharacters[i]
                            vm.isLoading.toggle()
                            vm.isLoading.toggle()
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
        }
        .task {
            await vm.getData()
            if !vm.filteredCharacters.isEmpty {
                characterToShow = vm.filteredCharacters[0]
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
