//
//  ContentView.swift
//  pokedex
//
//  Created by Juan Kuga on 25/10/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: pokedexDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(pokedexDocument()))
}
