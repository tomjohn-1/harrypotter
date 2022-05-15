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
    
    var body: some View {
        
        ScrollView {
            LazyVStack (alignment: .leading) {
                
                ForEach(0..<vm.characters.count, id: \.self) { i in
                    
                    Button {
                        infoShowing = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: 100)
                            
                            HStack {
                                Text(vm.characters[i].name)
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
        }
        .sheet(isPresented: $infoShowing) {
            
        } content: {
            InfoView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
