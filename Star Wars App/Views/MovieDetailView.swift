//
//  MovieDetailView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 22.10.23.
//

import SwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject var swapiModel: SwapiModel
    
    var movieTitle: String
    var movieEpisode: Int
    var movieDirector: String
    var movieProducer: String
    var movieReleaseDate: String
    var movieCharacters: [String]
    var moviePlanets: [String]
    var movieStarships: [String]
    var movieVehicles: [String]
    var movieSpecies: [String]
    
    var body: some View {
        
        List {
            
            Section("About the Movie") {
                
                HStack {
                    
                    Text("Episode:")
                    Text(String(movieEpisode))
                }
                
                HStack {
                    
                    Text("Release Date:")
                    Text(String(movieReleaseDate))
                }
                
                HStack {
                    
                    Text("Director:")
                    Text(String(movieDirector))
                }
                
                HStack {
                    
                    Text("Producer:")
                    Text(String(movieProducer))
                }
            }
            
            Section("Explore") {
                
                NavigationLink(destination: CharactersView(movieCharacters: movieCharacters)) {
                    Text("Characters")
                }
                
                NavigationLink(destination: PlanetsView(moviePlanets: moviePlanets)) {
                    Text("Planets")
                }
                
                NavigationLink(destination: StarshipsView(movieStarships: movieStarships)) {
                    Text("Starships")
                }
                
                NavigationLink(destination: VehiclesView(movieVehicles: movieVehicles)) {
                    Text("Vehicles")
                }
                
                NavigationLink(destination: SpeciesView(movieSpecies: movieSpecies)) {
                    Text("Species")
                }
            }
        }
        .navigationTitle(movieTitle)
    }
}

#Preview {
    MovieDetailView(movieTitle: "Dream of a Junior Jedi",
                    movieEpisode: 7,
                    movieDirector: "Dream Company",
                    movieProducer: "Livia",
                    movieReleaseDate: "2023-10-25",
                    movieCharacters: ["https://swapi.dev/api/people/1/"],
                    moviePlanets: ["https://swapi.dev/api/planets/1/"],
                    movieStarships: ["https://swapi.dev/api/starships/1/"],
                    movieVehicles: ["https://swapi.dev/api/vehicles/1/"],
                    movieSpecies: ["https://swapi.dev/api/species/1/"]
    )
}

