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

    
    @State var checked = false
    
    init() {
           UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Inter-SemiBold", size: 30)!]
       }
    
    var body: some View {
        Spacer()
        NavigationStack {
            Text("")
                .navigationTitle("Sign Up")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("X") {
                            print("X tapped!")
                        }.foregroundColor(.gray)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                            Label("Login", systemImage: "").foregroundColor(Color(hex: 0x5DB075))
                        }
                        
                    }
                }.navigationBarTitleDisplayMode(.inline)
            
            
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
                    Text(isPasswordVisible ? "Hide" : "Show").foregroundColor(Color(hex: 0x5DB075))
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
}

#Preview {
    SignUpView()
}
