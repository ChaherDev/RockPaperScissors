//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Chaher Machhour on 03/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var appMove = 0 // Le choix de l'app qui changera au hazard
    @State private var shouldWin = true // Si le joueur doit gagner ou perdre
    @State private var score = 0 // Le score du joueur
    @State private var questionCount = 0 // Le nombre de tours joués
    
    var body: some View {
        VStack {
            Text("Score : \(score)")
                .font(.largeTitle)
            
            if questionCount < 10 {
                Text("L'App a joué : \(moves[appMove])")
                    .font(.title)
                
                Text(shouldWin ? "Vous devez gagner" : "Vous devez perdre")
                    .font(.title2)
                
                // Les boutons
                
                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            // Action
                            self.playerMove(number)
                        } label: {
                            Text(self.moves[number])
                                .font(.system(size: 50))
                        }
                    }
                }
            } else {
                Text("Jeu terminé ! Score final : \(score)")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
    
    func playerMove(_ playerChoice: Int) {
        let winningMoves = [1, 2, 0] // Papier bat pierre, Ciseaux bat papier, Pierre bat Ciseaux
        
        if shouldWin {
            if playerChoice == winningMoves[appMove] {
                score += 1 // le joueur a choisi le bon mouv
            } else {
                score -= 1 // Le joueur s'est trompé
            }
        } else {
            if playerChoice == appMove {
                score -= 1 // le joueur a choisi le mm mouv que l'ordi
            } else if winningMoves[playerChoice] == appMove {
                score += 1 // le joueur a choisi un mouvement qui perd
            }
        }
        
        // Next question
        appMove = Int.random(in: 0..<3) // Choisir un new mouv
        shouldWin = Bool.random() // Alterner entre gangner et perdre
        questionCount += 1
    }
}

#Preview {
    ContentView()
}
