//
//  ContentView.swift
//  StonePaperScissor
//
//  Created by Harshali on 13/12/24.
//

import SwiftUI

struct ContentView: View {
    let choices = ["Rock", "Paper", "Scissors"]
    @State private var userChoice: String = ""
    @State private var computerChoice: String = ""
    @State private var resultMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Paper, Stone, Scissors")
                .font(.largeTitle)
                .bold()

            Text("Your Choice: \(userChoice)")

            Text("Computer's Choice: \(computerChoice)")

            Text(resultMessage)
                .font(.title2)
                .foregroundColor(resultMessage.contains("Win") ? .green : .red)

            HStack {
                ForEach(choices, id: \..self) { choice in
                    Button(action: {
                        playGame(with: choice)
                    }) {
                        Text(choice)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
        .padding()
    }

    func playGame(with userSelection: String) {
        userChoice = userSelection
        computerChoice = choices.randomElement() ?? "Rock"

        if userChoice == computerChoice {
            resultMessage = "It's a Draw!"
        } else if (userChoice == "Rock" && computerChoice == "Scissors") ||
                  (userChoice == "Scissors" && computerChoice == "Paper") ||
                  (userChoice == "Paper" && computerChoice == "Rock") {
            resultMessage = "You Win!"
        } else {
            resultMessage = "You Lose!"
        }
    }
}

@main
struct PaperStoneScissorsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

