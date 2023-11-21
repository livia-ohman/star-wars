//
//  Swapi.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 22.10.23.
//

import Foundation

struct SwapiMovies: Decodable {
    var results: [SwapiMovie]
}

struct SwapiMovie: Decodable {
    var title: String
    var episodeId: Int
    var director: String
    var producer: String
    var releaseDate: String
    var characters: [String]
    var planets: [String]
    var starships: [String]
    var vehicles: [String]
    var species: [String]
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case releaseDate = "release_date"
        case title
        case director
        case producer
        case characters
        case planets
        case starships
        case vehicles
        case species
    }
}

struct SwapiCharacter: Decodable, Hashable {
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    
    enum CodingKeys: String, CodingKey {
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case name
        case height
        case mass
        case gender
    }
}

struct SwapiPlanet: Decodable, Hashable {
    var name: String
    var rotationPeriod: String
    var orbitalPeriod: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surfaceWater: String
    var population: String
    
    enum CodingKeys: String, CodingKey {
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case surfaceWater = "surface_water"
        case name
        case diameter
        case climate
        case gravity
        case terrain
        case population
    }
}

struct SwapiStarship: Decodable, Hashable {
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
    
    enum CodingKeys: String, CodingKey {
        case costInCredits = "cost_in_credits"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
        case name
        case model
        case manufacturer
        case length
        case crew
        case passengers
        case consumables
    }
}

struct SwapiVehicle: Decodable, Hashable {
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
    var vehicleClass: String
    
    enum CodingKeys: String, CodingKey {
        case costInCredits = "cost_in_credits"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case vehicleClass = "vehicle_class"
        case name
        case model
        case manufacturer
        case length
        case crew
        case passengers
        case consumables
    }
}

struct SwapiSpecies: Decodable, Hashable {
    var name: String
    var classification: String
    var designation: String
    var averageHeight: String
    var skinColors: String
    var hairColors: String
    var eyeColors: String
    var averageLifespan: String
    var language: String
    
    enum CodingKeys: String, CodingKey {
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case name
        case classification
        case designation
        case language
    }
}
