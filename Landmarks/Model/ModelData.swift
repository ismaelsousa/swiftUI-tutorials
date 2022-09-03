//
//  ModelData.swift
//  Landmarks
//
//  Created by Ismael Sousa on 01/09/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject{
   @Published var landmarks: [Landmark] = load("landmarkData.json")
}


func load<T: Decodable>(_ filename: String)-> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Coundn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Coundn't load \(filename) from main bundle: \n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Coundn't parse \(filename) as \(T.self):\n\(error)")
    }
}