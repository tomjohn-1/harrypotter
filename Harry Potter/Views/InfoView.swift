//
//  InfoView.swift
//  Harry Potter
//
//  Created by Tom Johnson on 15/05/2022.
//

import SwiftUI

struct InfoView: View {
    
    
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 200)
            
            Group {
                Text("name")
                Text("alterante_name")
                Text("species")
                Text("gender")
                Text("house")
                Text("dateOfBirth")
                Text("wizard")
                Text("ancestry")
                Text("eyeColour")
                Text("hair colour")
            }
            
            Group {
                Text("wand")
                Text("patronus")
                Text("hogwarts student")
                Text("staff")
                Text("actor")
                Text("alternate_actors")
                Text("alive")
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
