//
//  PlanetsView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct PlanetsView: View {
    
    @EnvironmentObject var swapiModel: SwapiModel
    
    var moviePlanets: [String]
    
    var body: some View {
        
        List {
            
            if swapiModel.swapiPlanet.isEmpty {
                
                ProgressView()
                
            } else {
                
                // Loop through all characters and sort them asc by name
                ForEach(swapiModel.swapiPlanet.sorted(by: {$0.name < $1.name}), id: \.self) { planet in
                    NavigationLink(destination: PlanetDetailView(name: planet.name,
                                                                 rotationPeriod: planet.rotationPeriod,
                                                                 orbitalPeriod: planet.orbitalPeriod,
                                                                 diameter: planet.diameter,
                                                                 climate: planet.climate,
                                                                 gravity: planet.gravity,
                                                                 terrain: planet.terrain,
                                                                 surfaceWater: planet.surfaceWater,
                                                                 population: planet.population
                                                                )) {
                        Text(planet.name)
                    }
                }
            }
        }
        .navigationTitle("Planets")
        .onAppear {
            swapiModel.getDetailedData(apiUrls: moviePlanets) { (planets: [SwapiPlanet]) in
                
                // Completion handler
                self.swapiModel.swapiPlanet = planets
            }
        }
    }
}
