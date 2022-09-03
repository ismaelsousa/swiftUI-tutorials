//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Ismael Sousa on 30/08/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
