//
//  CharactersView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct CharactersView: View {
    
    @EnvironmentObject var swapiModel: SwapiModel
    
    var movieCharacters: [String]
    
    var body: some View {
        
        List {
            
            if swapiModel.swapiCharacter.isEmpty {
                
                ProgressView()
                
            } else {
                
                // Loop through all characters and sort them asc by name
                ForEach(swapiModel.swapiCharacter.sorted(by: {$0.name < $1.name}), id: \.self) { character in
                    NavigationLink(destination: CharacterDetailView(name: character.name,
                                                                    height: character.height,
                                                                    mass: character.mass,
                                                                    hairColor: character.hairColor,
                                                                    skinColor: character.skinColor,
                                                                    eyeColor: character.eyeColor,
                                                                    birthYear: character.birthYear,
                                                                    gender: character.gender)) {
                        Text(character.name)
                    }
                    
                }
                
            }
            
        }
        .navigationTitle("Characters")
        .onAppear {
            swapiModel.getDetailedData(apiUrls: movieCharacters) { (characters: [SwapiCharacter]) in
                
                // Completion handler
                self.swapiModel.swapiCharacter = characters
            }
        }
    }
}
