//
//  MoviesView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 22.10.23.
//

import SwiftUI

struct MoviesView: View {
    
    // Make SwapiModel data & methods available for this view
    @EnvironmentObject var swapiModel: SwapiModel
    
    var body: some View {
        
        // Navigation to browse through the movies
        NavigationView {
            
            List {
                
                // Loop through all movies and sort them asc by episode
                ForEach (swapiModel.swapiMovie.sorted(by: { $0.episodeId < $1.episodeId}), id: \.episodeId) { movie in
                    
                    // Navigate to the movie detail view and pass the data
                    NavigationLink(destination: MovieDetailView(movieTitle: movie.title, 
                                                                movieEpisode: movie.episodeId,
                                                                movieDirector: movie.director,
                                                                movieProducer: movie.producer,
                                                                movieReleaseDate: movie.releaseDate,
                                                                movieCharacters: movie.characters,
                                                                moviePlanets: movie.planets,
                                                                movieStarships: movie.starships,
                                                                movieVehicles: movie.vehicles,
                                                                movieSpecies: movie.species
                                                               )) {
                        Text(movie.title)
                    }
                }
            }
            .navigationTitle("All \(swapiModel.swapiMovie.count) Movies")
        }
    }
}

#Preview {
    MoviesView()
}
