//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Batuhan Doğan on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("GreenBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("DiceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                Spacer()
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color("ButtonColor"))
                Spacer()
            }
            
            
        }
    }
}

struct DiceView: View {
    let n: Int
    
    var body: some View {
        Image("Dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

