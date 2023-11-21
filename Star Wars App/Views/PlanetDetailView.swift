//
//  PlanetDetailView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct PlanetDetailView: View {
    
    var name: String
    var rotationPeriod: String
    var orbitalPeriod: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surfaceWater: String
    var population: String
    
    var body: some View {
        
        List {
            Text("Rotation Period: \(rotationPeriod)")
            Text("Orbital Period: \(orbitalPeriod)")
            Text("Diameter: \(diameter)")
            Text("Climate: \(climate)")
            Text("Gravity: \(gravity)")
            Text("Terrain: \(terrain)")
            Text("Surface Water: \(surfaceWater)")
            Text("Population: \(population)")
        }
        .navigationTitle(name)
        
    }
}
