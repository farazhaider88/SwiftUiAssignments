//
//  CommonViews.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 18/12/2023.
//

import SwiftUI

func setTitle(_ title:String) -> Text {
    return Text(title).font(Font.custom("Inter-SemiBold", size: 30))
}

func setConfirmButton(_ title:String) -> some View {
    return Button(title) {
        print("Login Clicked")
    }.frame(width: 343)
        .frame(height: 51)
        .padding([.leading,.trailing],16)
        .background(Color(hex: 0x5DB075))
        .foregroundColor(Color.white)
        .cornerRadius(30)
        .font(Font.custom("Inter-SemiBold", size: 16))
        .padding()
}

func setForgotPasswordButton(_ title:String) -> some View {
    return Button(title) {
        print("Forgot Clicked")
    }
    .foregroundColor(Color(hex: 0x5DB075))
    .font(Font.custom("Inter-SemiBold", size: 16))
}


struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(hex: 0x5DB075) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}
