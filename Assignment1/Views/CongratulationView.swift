//
//  CongratulationView.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 26/12/2023.
//

import SwiftUI

struct CongratulationView: View {
    @State private var isPresented = false
    var body: some View {
        ZStack{
            Color(hex: 0x5DB075, alpha: 1)
                .ignoresSafeArea()
            VStack(){
                Text("Congratulations!").font(Font.custom("Inter-Medium", size: 30))
                    .padding(.bottom,10)
                Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt.").font(Font.custom("Inter-Medium", size: 16)).padding(.bottom,45).foregroundColor(Color(hex: 0x666666, alpha: 1)).multilineTextAlignment(.center)
              
                PrimaryButtonView(title: "Click Me", width: 275, buttonAction: {
                    isPresented = true
                }) .fullScreenCover(isPresented: $isPresented, content: RateOurAppView.init)
                    .padding(.bottom,18)

                SecondaryButtonView(title: "Secondary Action") {
                    
                }
            }.frame(width: 343,height: 363)
                .background(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CongratulationView()
}
