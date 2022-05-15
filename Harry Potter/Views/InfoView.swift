//
//  InfoView.swift
//  Harry Potter
//
//  Created by Tom Johnson on 15/05/2022.
//

import SwiftUI

struct InfoView: View {
    
    var character: Character
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10) {
            
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 200)
            
            Group {
                Text(character.name)
                    .bold()
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
            .font(Font.system(size: 20))
            .padding(.horizontal)
            
            Group {
                Text("wand")
                Text("patronus")
                Text("hogwarts student")
                Text("staff")
                Text("actor")
                Text("alternate_actors")
                Text("alive")
            }
            .font(Font.system(size: 20))
            .padding(.horizontal)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

//struct InfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoView(character: Character()
//    }
//}
