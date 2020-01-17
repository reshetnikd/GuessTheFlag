//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dmitry Reshetnik on 17.01.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
            
            HStack {
                Text("4")
                Text("5")
                Text("6")
            }
            
            HStack {
                Text("7")
                Text("8")
                Text("9")
            }
            
            Button("Tap me!") {
                print("Button was tapped")
            }
            
            Button("Show Alert") {
                self.showingAlert = true
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
            }
            
            Button(action: {
                print("Edit was tapped")
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil").renderingMode(.original)
                    Text("Edit")
                }
            }
            
            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
            
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
            
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                Color(red: 1, green: 0.8, blue: 0).frame(width: 200, height: 200, alignment: .center)
                Text("Your content")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
