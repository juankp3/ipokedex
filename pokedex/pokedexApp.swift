//
//  pokedexApp.swift
//  pokedex
//
//  Created by Juan Kuga on 25/10/24.
//

import SwiftUI

@main
struct pokedexApp: App {
    var body: some Scene {
        WindowGroup{
            PokedexView()
        }
        /**
        DocumentGroup(newDocument: pokedexDocument()) { file in
            ContentView(document: file.$document)
        }
         */
        
    }
}
