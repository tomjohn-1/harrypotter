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
            
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 200)
                
                if character.imageData != nil {
                    Image(uiImage: UIImage(data: character.imageData!) ?? UIImage())
                }
                
            }
            Group {
                Text(character.name)
                    .bold()
                HStack (spacing: 10) {
                    Text("Alternate names: ")
                    Text(character.alternate_names.first ?? "")
                }
                HStack (spacing: 10) {
                    Text("Species: ")
                    Text(character.species)
                }
                HStack (spacing: 10) {
                    Text("Gender: ")
                    Text(character.gender)
                }
                HStack (spacing: 10) {
                    Text("House: ")
                    Text(character.house)
                }
                HStack (spacing: 10) {
                    Text("Date of Birth: ")
                    Text(character.dateOfBirth)
                }
                HStack (spacing: 10) {
                    Text("Wizard: ")
                    Text(character.wizard ? "Wizard" : "Not a wizard")
                }
                HStack (spacing: 10) {
                    Text("Ancestry: ")
                    Text(character.ancestry)
                }
                HStack (spacing: 10) {
                    Text("Eye Colour: ")
                    Text(character.eyeColour)
                }
                HStack (spacing: 10) {
                    Text("Hair Colour: ")
                    Text(character.hairColour)
                }
            }
            .font(Font.system(size: 20))
            .padding(.horizontal)
            
            Group {
                HStack (spacing: 10) {
                    Text("Wand: ")
                    Text("\(character.wand.wood) with a \(character.wand.core) core")
                }
                HStack (spacing: 10) {
                    Text("Patronus: ")
                    Text(character.patronus)
                }
                HStack (spacing: 10) {
                    Text("Student: ")
                    Text(character.hogwartsStudent ? "Is a Student" : "Not a Student")
                }
                HStack (spacing: 10) {
                    Text("Staff: ")
                    Text(character.hogwartsStaff ? "Is Staff" : "Not Staff")
                }
                HStack (spacing: 10) {
                    Text("Actor: ")
                    Text(character.actor)
                }
                HStack (spacing: 10) {
                    Text("Alternate Actors: ")
                    Text(character.alternate_actors.first ?? "")
                }
                HStack (spacing: 10) {
                    Text("Alive: ")
                    Text(character.alive ? "Is alive" : "Dead")
                }
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
