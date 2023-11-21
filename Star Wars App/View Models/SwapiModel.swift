//
//  SwapiModel.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 22.10.23.
//

import Foundation

class SwapiModel: ObservableObject {
    
    // Get the data when the app launches
    init() {
        getMovies()
    }
    
    @Published var swapiMovies: [SwapiMovies]?
    @Published var swapiMovie = [SwapiMovie]()
    @Published var swapiCharacter = [SwapiCharacter]()
    @Published var swapiPlanet = [SwapiPlanet]()
    @Published var swapiStarship = [SwapiStarship]()
    @Published var swapiVehicle = [SwapiVehicle]()
    @Published var swapiSpecies = [SwapiSpecies]()
    
    let swapiBaseUrl = "https://swapi.dev/api/"
    
    // Get the URL Session
    let urlSession = URLSession.shared
    
    // MARK: Movie Data
    func getMovies() {
        
        // Create the url for the movie data
        let url = URL(string: swapiBaseUrl + "films/")
        
        // Assure url is not nil
        if let url = url {
            
            // Create a data task
            let dataTask = urlSession.dataTask(with: url) {[weak self] ( data, response, error) in
                
                // Check that there are no error
                if error == nil {
                    
                    // Parse the JSON data
                    do {
                        
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(SwapiMovies.self, from: data!)
                        
                        DispatchQueue.main.async {
                            
                            // Assign the results of each movie to the published property
                            self?.swapiMovie = result.results
                        }
                        
                    } catch {
                        
                        print(error)
                    }
                    
                } else {
                    print("Data task error: \(String(describing: error))")
                    
                }
            }
            
            // Start the data task
            dataTask.resume()
        }
    }
    
    // MARK: Get detailed Data via generic function
    func getDetailedData<T: Decodable>(apiUrls: [String], completion: @escaping ([T]) -> Void) {
        
        // Create an empty array to store the results
        var dataResults: [T] = []
        
        // Dispatch Group for parallel loading of all data within the loop
        let dispatchGroup = DispatchGroup()
        
        // Loop through the data urls
        for apiUrl in apiUrls {
            
            // Enter the Dispatch Group
            dispatchGroup.enter()
            
            // Create a url out of the string
            let dataUrl = URL(string: apiUrl)
            
            // Assure the url is not nil
            if let dataUrl = dataUrl {
                
                // Create the data task
                let dataTask = urlSession.dataTask(with: dataUrl) {(data, response, error) in
                    
                    // Leave when the task is done
                    defer {
                        dispatchGroup.leave()
                    }
                    
                    // Check for errors
                    if error == nil {
                        
                        // Parse the JSON Data
                        do {
                            
                            let decoder = JSONDecoder()
                            let dataResult = try decoder.decode(T.self, from: data!)
                            
                            // Assign the results to the empty array
                            dataResults.append(dataResult)
                        } catch {
                            
                            print(error)
                        }
                    }
                }
                
                dataTask.resume()
                
                // Notify the waiting dispatch group that all requests are complete
                dispatchGroup.notify(queue: DispatchQueue.main) {
                    
                    // Assign the data results
                    completion(dataResults)
                }
            }
        }
    }
}
