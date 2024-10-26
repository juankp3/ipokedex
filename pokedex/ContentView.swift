//
//  ContentView.swift
//  pokedex
//
//  Created by Juan Kuga on 25/10/24.
//

import SwiftUI
import AVFoundation

struct PokedexView: View {
    @State private var pokemonName: String = "" // Variable de estado para el nombre del Pokémon ingresado
    private let speechSynthesizer = AVSpeechSynthesizer() // Sintetizador de voz
    
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
                speakText(pokemonName)
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
    
    // Función para leer el texto en voz alta
    func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-ES") // Configura la voz en español (de España)
        utterance.rate = 0.5 // Velocidad de la voz
        
        speechSynthesizer.speak(utterance)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}

