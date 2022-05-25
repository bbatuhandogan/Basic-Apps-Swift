//
//  ContentView.swift
//  PersonalCard
//
//  Created by Batuhan Doğan on 17.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.07, green: 0.45, blue: 0.87, opacity: 1.00)
                .ignoresSafeArea(.all)
            VStack {
                Image("user-icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 5))
                Text("Batuhan Doğan")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(Color.white)
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "+90 553 005 02 44", image: "phone.fill")
                InfoView(text: "batuhandogan130@gmail.com", image: "envelope.fill")
            }
            
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

