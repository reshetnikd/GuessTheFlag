//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dmitry Reshetnik on 17.01.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var playerScore = 0
    @State private var scoreMessage = ""
    @State private var animationAngle = 0.0
    @State private var opacityAmount = 1.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of ")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        withAnimation(.default) {
                            self.flagTapped(number)
                        }
                    }) {
                        if number == self.correctAnswer {
                            FlagImage(name: self.countries[number])
                                .rotation3DEffect(.degrees(self.animationAngle), axis: (x: 0, y: 1, z: 0))
                        } else {
                            FlagImage(name: self.countries[number])
                                .opacity(self.opacityAmount)
                        }
                    }
                }
                
                Text("Score: \(playerScore)")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            playerScore += 1
            scoreMessage = "Your score is \(playerScore)"
            animationAngle += 360
            opacityAmount = 0.25
        } else {
            scoreTitle = "Wrong"
            playerScore -= 1
            scoreMessage = "That's the flag of \(countries[number])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        opacityAmount = 1.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagImage: View {
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule()
                .stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}
