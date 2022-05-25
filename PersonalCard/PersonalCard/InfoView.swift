//
//  InfoView.swift
//  PersonalCard
//
//  Created by Batuhan Doğan on 17.05.2022.
//

import SwiftUI


struct InfoView: View {
    let text: String
    let image: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 60, style: .circular)
            .fill(.white)
            .frame(height: 50)
            .padding()
            .overlay(
                HStack {
                    Image(systemName: image)
                        .foregroundColor(.green)
                        .font(.system(size: 25))
                    Text(text)
                        .font(.system(size: 20))
                }
            )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello", image: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
