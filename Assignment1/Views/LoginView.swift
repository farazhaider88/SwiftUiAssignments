//
//  ContentView.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 18/12/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var emailAddress: String = ""
    @State private var isEmailValid: Bool = true
    
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    @State private var isPasswordValid: Bool = true
    @State private var selection = false
    var body: some View {
        NavigationStack {
            setTitle("Log In")
            
            NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true), isActive: $selection, label: {
                
            })
            
            
            
            TextField("Email", text: $emailAddress , onCommit: {
                isEmailValid = validateEmail(email: emailAddress)
            })
            .padding()
            .background(Color(hex: 0xE8E8E8))
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .cornerRadius(8)
            .padding(.horizontal)
            .padding(.bottom,16)
            .padding(.top,32)
            
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
                    Text(isPasswordVisible ? "Hide" : "Show").foregroundColor(Color(hex: 0x5DB075))
                }
            }
            .padding()
            .background(Color(hex: 0xE8E8E8))
            .cornerRadius(8)
            .padding(.horizontal)
            
            if !isPasswordValid {
                Text("Password must be at least 8 characters.")
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            PrimaryButtonView(title: "Log In") {
                selection = true
                
            }.padding(.bottom,16)

            
            SecondaryButtonView(title: "Forgot your password?") {
                
            }
            
            Spacer()
        }
    }
    
}

#Preview {
    LoginView()
}



//navigationDestination
//binding false , pop
