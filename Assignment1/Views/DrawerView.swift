//
//  DrawerView.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 26/12/2023.
//

import SwiftUI

struct DrawerView: View {
    var body: some View {
        VStack(spacing:10){
            Text("Drawer Header").font(Font.custom("Inter-Medium", size: 30))
            Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation.").font(Font.custom("Inter-Medium", size: 16)).padding()
            setConfirmButton("Click Me")
            Button("Secondary Action") {
                
            }.frame(width: 343)
                .frame(height: 51)
                .foregroundColor(Color(hex: 0x5DB075))
                .cornerRadius(30)
                .font(Font.custom("Inter-SemiBold", size: 16))
        }.padding(.all,10)
    }
}

#Preview {
    DrawerView()
}
