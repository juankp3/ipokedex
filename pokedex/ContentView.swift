//
//  ContentView.swift
//  pokedex
//
//  Created by Juan Kuga on 25/10/24.
//

import SwiftUI

struct PokedexView: View {
    @State private var pokemonName: String = "" // Variable de estado para el nombre del Pokémon ingresado
    
    var body: some View {
        VStack {
            Text("Pokedex")
                .font(.largeTitle)
                .padding()
            
            TextField("Ingresa el nombre del Pokémon", text: $pokemonName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Acción del botón para leer el texto ingresado
                print("Nombre del Pokémon ingresado: \(pokemonName)")
            }) {
                Text("Buscar")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
