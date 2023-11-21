//
//  SpeciesView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct SpeciesView: View {
    
    @EnvironmentObject var swapiModel: SwapiModel
    
    var movieSpecies: [String]
    
    var body: some View {
        
        List {
            
            if swapiModel.swapiSpecies.isEmpty {
                
                ProgressView()
                
            } else {
                
                // Loop through all characters and sort them asc by name
                ForEach(swapiModel.swapiSpecies.sorted(by: {$0.name < $1.name}), id: \.self) { specie in
                    NavigationLink(destination: SpecieDetailView(name: specie.name,
                                                                 classification: specie.classification,
                                                                 designation: specie.designation,
                                                                 averageHeight: specie.averageHeight,
                                                                 skinColors: specie.skinColors,
                                                                 hairColors: specie.hairColors,
                                                                 eyeColors: specie.eyeColors,
                                                                 averageLifespan: specie.averageLifespan,
                                                                 language: specie.language
                                                                )) {
                        Text(specie.name)
                    }
                }
            }
        }
        .navigationTitle("Species")
        .onAppear {
            swapiModel.getDetailedData(apiUrls: movieSpecies) { (species: [SwapiSpecies]) in
                
                // Completion handler
                self.swapiModel.swapiSpecies = species
            }
        }
    }
}
