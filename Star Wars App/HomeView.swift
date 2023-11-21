//
//  ContentView.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 22.10.23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var swapiModel: SwapiModel
    
    var body: some View {
        
        // Check if the app retrieved the API data
        if swapiModel.swapiMovie.isEmpty == true {
            
            // No data retreived, show progress animation
            ProgressView()
            
        } else {
            
            // Data retrieved, show movies view
            MoviesView()
            
        }
    }
}

#Preview {
    HomeView()
}
