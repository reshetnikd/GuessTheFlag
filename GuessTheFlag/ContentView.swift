//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dmitry Reshetnik on 17.01.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
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
