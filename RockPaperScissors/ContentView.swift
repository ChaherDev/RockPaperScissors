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
    @State private var questiionCount = 0 // Le nombre de tours joués
    
    var body: some View {
        VStack {
            Text("Score : \(score)")
                .font(.largeTitle)
            
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
        }
        .padding()
    }
    
    func playerMove(_ playerChoice: Int) {
        // on va gérer le choix du joueur
    }
}

#Preview {
    ContentView()
}
