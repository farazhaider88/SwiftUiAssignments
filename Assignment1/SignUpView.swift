//
//  SignUpView.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 18/12/2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var emailAddress: String = ""
    @State private var isEmailValid: Bool = true
    
    @State private var name: String = ""
    @State private var isNameValid: Bool = true
    
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    @State private var isPasswordValid: Bool = true
    
    @State private var isSheetPresented = false
    
    @State var checked = false
    
    var body: some View {
        HStack{
            Button("X") {
                
            }.foregroundColor(.gray)
            Spacer()
            setTitle("Sign Up")
            Spacer()
            Button("Login"){
                isSheetPresented.toggle()
            }.foregroundColor(Color(hex: 0x5DB075))
                .sheet(isPresented: $isSheetPresented) {
                               LoginView()
                           }
            
        }.padding([.leading,.trailing])
        
        
        TextField("Name", text: $name , onCommit: {
             isNameValid = validateName(name: name)
        })
        .padding()
        .background(Color(hex: 0xE8E8E8))
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .cornerRadius(8)
        .padding(.horizontal)
        
        if !isNameValid {
            Text("Please don't leave name field empty")
                .foregroundColor(.red)
        }
        
        TextField("Email", text: $emailAddress , onCommit: {
            isEmailValid = validateEmail(email: emailAddress)
        })
        .padding()
        .background(Color(hex: 0xE8E8E8))
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .cornerRadius(8)
        .padding(.horizontal)
        
        if !isEmailValid {
            Text("Please enter a valid email address.")
                .foregroundColor(.red)
        }
        
        
        
        HStack {
            if isPasswordVisible {
                TextField("Password", text: $password , onCommit: {
                    isPasswordValid = validatePassword(password: password)
                })
            } else {
                SecureField("Password", text: $password, onCommit: {
                    isPasswordValid = validatePassword(password: password)
                })
            }
            
            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(hex: 0xE8E8E8))
        .cornerRadius(8)
        .padding(.horizontal)
        .padding(.bottom, 10)
        
        if !isPasswordValid {
            Text("Password must be at least 8 characters.")
                .foregroundColor(.red)
        }
        
        HStack(spacing:16){
            CheckBoxView(checked: $checked)
            VStack(alignment: .leading) {
                Text("I would like to receive your newsletter and other promotional information.").foregroundColor(Color(hex: 0x666666))
            }
        }
        
        setConfirmButton("Sign Up")
        
        setForgotPasswordButton("Forgot your password?")
        
        Spacer()
    }
}

#Preview {
    SignUpView()
}
