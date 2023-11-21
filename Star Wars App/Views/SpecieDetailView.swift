//
//  SpecieDetailView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 23.10.23.
//

import SwiftUI

struct SpecieDetailView: View {
    
    var name: String
    var classification: String
    var designation: String
    var averageHeight: String
    var skinColors: String
    var hairColors: String
    var eyeColors: String
    var averageLifespan: String
    var language: String
    
    var body: some View {
        
        List {
            Text("Classification: \(classification)")
            Text("Designation: \(designation)")
            Text("Ø Height: \(averageHeight)")
            Text("Skin Color: \(skinColors)")
            Text("Hair Color: \(hairColors)")
            Text("Eye Color: \(eyeColors)")
            Text("Ø Lifespan: \(averageLifespan)")
            Text("Language: \(language)")
        }
        .navigationTitle(name)
        
    }
}
