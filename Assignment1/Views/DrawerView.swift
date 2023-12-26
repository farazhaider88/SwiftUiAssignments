//
//  DrawerView.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 26/12/2023.
//

import SwiftUI

struct DrawerView: View {
    @State private var isPresented = false
    var body: some View {
        VStack(spacing:10){
            Spacer()
            Text("Drawer Header").font(Font.custom("Inter-Medium", size: 30))
                .padding(.bottom,10)
            Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation.").font(Font.custom("Inter-Medium", size: 16)).padding()
          
            PrimaryButtonView(title: "Click Me", buttonAction: {
                isPresented = true
            }) .fullScreenCover(isPresented: $isPresented, content: CongratulationView.init)

            SecondaryButtonView(title: "Secondary Action") {
                
            }
        }.frame(height: 295)
        
    }
}

#Preview {
    DrawerView()
}

