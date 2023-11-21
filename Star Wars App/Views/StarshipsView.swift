//
//  StarshipView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct StarshipsView: View {
    
    @EnvironmentObject var swapiModel: SwapiModel
    
    var movieStarships: [String]
    
    var body: some View {
        
        List {
            
            if swapiModel.swapiStarship.isEmpty {
                
                ProgressView()
                
            } else {
                
                // Loop through all characters and sort them asc by name
                ForEach(swapiModel.swapiStarship.sorted(by: {$0.name < $1.name}), id: \.self) { starship in
                    NavigationLink(destination: StarshipDetailView(name: starship.name,
                                                                   model: starship.model,
                                                                   manufacturer: starship.manufacturer,
                                                                   costInCredits: starship.costInCredits,
                                                                   length: starship.length,
                                                                   maxAtmospheringSpeed: starship.maxAtmospheringSpeed,
                                                                   crew: starship.crew,
                                                                   passengers: starship.passengers,
                                                                   cargoCapacity: starship.cargoCapacity,
                                                                   consumables: starship.consumables,
                                                                   hyperdriveRating: starship.hyperdriveRating,
                                                                   mglt: starship.mglt,
                                                                   starshipClass: starship.starshipClass
                                                                  )) {
                        Text(starship.name)
                    }
                }
            }
        }
        .navigationTitle("Starships")
        .onAppear {
            swapiModel.getDetailedData(apiUrls: movieStarships) { (starships: [SwapiStarship]) in
                
                // Completion handler
                self.swapiModel.swapiStarship = starships
            }
        }
    }
}
