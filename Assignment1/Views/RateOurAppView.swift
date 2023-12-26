//
//  RateOurAppView.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 26/12/2023.
//

import SwiftUI

struct RateOurAppView: View {
    @State private var isPresented = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color(hex: 0x5DB075, alpha: 1)
                .ignoresSafeArea()
            VStack(){
                HStack {
                    ForEach(0 ..< 5) { item in
                        Image(systemName: "star.fill")
                            .renderingMode(.original)
                            .foregroundStyle(.blue)
                            .frame(width: 32,height: 32)
                        .font(.largeTitle)
                    }
                }.padding(.bottom,32)
                
                Text("Rate our app").font(Font.custom("Inter-Medium", size: 30))
                    .padding(.bottom,10)
                Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt.").font(Font.custom("Inter-Medium", size: 16)).padding(.bottom,45).foregroundColor(Color(hex: 0x666666, alpha: 1)).multilineTextAlignment(.center)
              
                PrimaryButtonView(title: "I love it!", width: 275, buttonAction: {
                    isPresented = true
                }).padding(.bottom,18)

                SecondaryButtonView(title: "Don’t like the app? Let us know.") {
                    dismiss()
                }
            }.frame(width: 343,height: 427)
                .background(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    RateOurAppView()
}
