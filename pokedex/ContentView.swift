//
//  ContentView.swift
//  pokedex
//
//  Created by Juan Kuga on 25/10/24.
//

import SwiftUI
import AVFoundation

// Clase auxiliar para manejar la reproducción de audio
class AudioPlayerHelper: NSObject, AVAudioPlayerDelegate {
    var onFinishPlaying: (() -> Void)?
    private var audioPlayer: AVAudioPlayer?

    func playSound(resourceName: String, onFinish: @escaping () -> Void) {
        onFinishPlaying = onFinish
        if let soundURL = Bundle.main.url(forResource: resourceName, withExtension: "mp3", subdirectory: "audio") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.delegate = self
                audioPlayer?.play()
            } catch {
                print("Error al reproducir el audio: \(error.localizedDescription)")
                onFinishPlaying?()
            }
        } else {
            print("No se encontró el archivo de audio")
            onFinishPlaying?()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        onFinishPlaying?()
    }
}

struct PokedexView: View {
    @State private var pokemonName: String = "Juan. es un desarrollador que esta aprendiendo a programar en SwiftUI con la ayuda del Chat GPT"
    private let speechSynthesizer = AVSpeechSynthesizer()
    private let audioPlayerHelper = AudioPlayerHelper() // Instancia de la clase auxiliar
    
    var body: some View {
        VStack {
            Text("Pokedex")
                .font(.largeTitle)
                .padding()
            
            TextField("Ingresa el nombre del Pokémon", text: $pokemonName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
            
                
                // Reproduce el sonido y luego lee el texto
                audioPlayerHelper.playSound(resourceName: "soydexter") {
                    speakText(pokemonName)
                }
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
    
    // Función para leer el texto en voz alta con una voz natural
    func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.0
        utterance.volume = 1.0
        
        speechSynthesizer.speak(utterance)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
