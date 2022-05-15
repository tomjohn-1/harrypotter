//
//  ContentView.swift
//  Harry Potter
//
//  Created by Tom Johnson on 12/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = CharactersModel()
    
    var body: some View {
        VStack {
            
            Text("Hello world")
            
        }
        .task {
            await vm.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
