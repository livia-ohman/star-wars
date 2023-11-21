//
//  CharacterDetailView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    
    var body: some View {
        
        List {
            Text("Height: \(height)")
            Text("Mass: \(mass)")
            Text("Hair Color: \(hairColor)")
            Text("Skin Color: \(skinColor)")
            Text("Eye Color: \(eyeColor)")
            Text("Year of Birth: \(birthYear)")
            Text("Gender: \(gender)")
        }
        .navigationTitle(name)
    }
}
