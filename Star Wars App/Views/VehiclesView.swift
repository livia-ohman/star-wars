//
//  VehicleView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct VehiclesView: View {
    
    @EnvironmentObject var swapiModel: SwapiModel
    
    var movieVehicles: [String]
    
    var body: some View {
        
        List {
            
            if swapiModel.swapiVehicle.isEmpty {
                
                ProgressView()
                
            } else {
                
                // Loop through all characters and sort them asc by name
                ForEach(swapiModel.swapiVehicle.sorted(by: {$0.name < $1.name}), id: \.self) { vehicle in
                    NavigationLink(destination: VehicleDetailView(name: vehicle.name,
                                                                  model: vehicle.model,
                                                                  manufacturer: vehicle.manufacturer,
                                                                  costInCredits: vehicle.costInCredits,
                                                                  length: vehicle.length,
                                                                  maxAtmospheringSpeed: vehicle.maxAtmospheringSpeed,
                                                                  crew: vehicle.crew,
                                                                  passengers: vehicle.passengers,
                                                                  cargoCapacity: vehicle.cargoCapacity,
                                                                  consumables: vehicle.consumables,
                                                                  vehicleClass: vehicle.vehicleClass
                                                                 )) {
                        Text(vehicle.name)
                    }
                }
            }
        }
        .navigationTitle("Vehicles")
        .onAppear {
            swapiModel.getDetailedData(apiUrls: movieVehicles) { (vehicles: [SwapiVehicle]) in
                
                // Completion handler
                self.swapiModel.swapiVehicle = vehicles
            }
        }
    }
}
