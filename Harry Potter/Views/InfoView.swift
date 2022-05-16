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
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipped()
                }
            }
            
            Text(character.name)
                .bold()
                .font(Font.system(size: 24))
                .padding(.horizontal)
                .padding(.top, 10)
            
            HStack (alignment: .top, spacing: 30) {
                VStack (alignment: .leading, spacing: 10) {
                    Text("Alternate names: ")
                    Text("Species: ")
                    Text("Gender: ")
                    Text("House: ")
                    Text("Date of Birth: ")
                    Text("Wizard: ")
                    Text("Ancestry: ")
                    Text("Eye Colour: ")
                    Text("Hair Colour: ")
                }
                
                VStack (alignment: .leading, spacing: 10) {
                    Text(character.alternate_names.first ?? "no other names")
                    Text(character.species)
                    Text(character.gender)
                    Text(character.house)
                    Text(character.dateOfBirth)
                    Text(character.wizard ? "Wizard" : "Not a wizard")
                    Text(character.ancestry)
                    Text(character.eyeColour)
                    Text(character.hairColour)
                }
            }
            .font(Font.system(size: 20))
            .padding(.horizontal)
            
            HStack (alignment: .center, spacing: 30) {
                VStack (alignment: .leading, spacing: 10) {
                    Text("Wand: ")
                    Text("Patronus: ")
                    Text("Student: ")
                    Text("Staff: ")
                    Text("Actor: ")
                    Text("Alternate Actors: ")
                    Text("Alive: ")
                }
                
                VStack (alignment: .leading, spacing: 10) {
                    Text("\(character.wand.wood) with a \(character.wand.core) core")
                    Text(character.patronus)
                    Text(character.hogwartsStudent ? "Is a Student" : "Not a Student")
                    Text(character.hogwartsStaff ? "Is Staff" : "Not Staff")
                    Text(character.actor)
                    Text(character.alternate_actors.first ?? "")
                    Text(character.alive ? "Is alive" : "Dead")
                }
            }
            .font(Font.system(size: 20))
            .padding(.horizontal)
            
//            Group {
//                Text(character.name)
//                    .bold()
//                HStack (spacing: 10) {
//                    Text("Alternate names: ")
//                    Spacer()
//                    Text(character.alternate_names.first ?? "")
//                }
//                HStack (spacing: 10) {
//                    Text("Species: ")
//                    Spacer()
//                    Text(character.species)
//                }
//                HStack (spacing: 10) {
//                    Text("Gender: ")
//                    Spacer()
//                    Text(character.gender)
//                }
//                HStack (spacing: 10) {
//                    Text("House: ")
//                    Text(character.house)
//                }
//                HStack (spacing: 10) {
//                    Text("Date of Birth: ")
//                    Text(character.dateOfBirth)
//                }
//                HStack (spacing: 10) {
//                    Text("Wizard: ")
//                    Text(character.wizard ? "Wizard" : "Not a wizard")
//                }
//                HStack (spacing: 10) {
//                    Text("Ancestry: ")
//                    Text(character.ancestry)
//                }
//                HStack (spacing: 10) {
//                    Text("Eye Colour: ")
//                    Text(character.eyeColour)
//                }
//                HStack (spacing: 10) {
//                    Text("Hair Colour: ")
//                    Text(character.hairColour)
//                }
//            }
//            .font(Font.system(size: 20))
//            .padding(.horizontal)
//
//            Group {
//                HStack (spacing: 10) {
//                    Text("Wand: ")
//                    Text("\(character.wand.wood) with a \(character.wand.core) core")
//                }
//                HStack (spacing: 10) {
//                    Text("Patronus: ")
//                    Text(character.patronus)
//                }
//                HStack (spacing: 10) {
//                    Text("Student: ")
//                    Text(character.hogwartsStudent ? "Is a Student" : "Not a Student")
//                }
//                HStack (spacing: 10) {
//                    Text("Staff: ")
//                    Text(character.hogwartsStaff ? "Is Staff" : "Not Staff")
//                }
//                HStack (spacing: 10) {
//                    Text("Actor: ")
//                    Text(character.actor)
//                }
//                HStack (spacing: 10) {
//                    Text("Alternate Actors: ")
//                    Text(character.alternate_actors.first ?? "")
//                }
//                HStack (spacing: 10) {
//                    Text("Alive: ")
//                    Text(character.alive ? "Is alive" : "Dead")
//                }
//            }
//            .font(Font.system(size: 20))
//            .padding(.horizontal)
            
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
