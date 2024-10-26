//
//  ContentView.swift
//  pokedex
//
//  Created by Juan Kuga on 25/10/24.
//

import SwiftUI
import AVFoundation

struct PokedexView: View {
    @State private var pokemonName: String = "Juan Kuga. Es un genio y le gusta programar" // Variable de estado para el nombre del Pokémon ingresado
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
    
    // Función para leer el texto en voz alta con una voz robótica
    func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-PE") // Puedes probar también "en-GB" o "en-AU" para variar
        utterance.rate = 0.5 // Velocidad más lenta para una entonación robótica
        utterance.pitchMultiplier = 1.0 // Reduce el tono para una voz más profunda y mecánica
        utterance.volume = 1.0 // Ajusta el volumen a un nivel más bajo, si es necesario
        
        speechSynthesizer.speak(utterance)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
