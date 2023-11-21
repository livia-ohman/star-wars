//
//  StarshipDetailView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct StarshipDetailView: View {
    
    var name: String
    var model: String
    var manufacturer: String
    var costInCredits: String
    var length: String
    var maxAtmospheringSpeed: String
    var crew: String
    var passengers: String
    var cargoCapacity: String
    var consumables: String
    var hyperdriveRating: String
    var mglt: String
    var starshipClass: String
    
    var body: some View {
        
        List {
            Text("Model: \(model)")
            Text("Manufacturer: \(manufacturer)")
            Text("Costs: \(costInCredits)")
            Text("Length: \(length)")
            Text("Max Speed: \(maxAtmospheringSpeed)")
            Text("Crew: \(crew)")
            Text("Passengers: \(passengers)")
            Text("Cargo Capacity: \(cargoCapacity)")
            Text("Consumables: \(consumables)")
            Text("Hyperdrive Rating: \(hyperdriveRating)")
            Text("MGLT: \(mglt)")
            Text("Starship Class: \(starshipClass)")
        }
        .navigationTitle(name)
        
    }
}
