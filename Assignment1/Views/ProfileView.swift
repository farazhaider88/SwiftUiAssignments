//
//  ProfileView.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 25/12/2023.
//

import SwiftUI

struct ProfileView: View {
    init() {
           UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Inter-SemiBold", size: 30)!,.foregroundColor: UIColor.white]
       }
    
    @State var index = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex: 0x5DB075, alpha: 1)
                    .ignoresSafeArea()
                
                Text("")
                    .navigationTitle("Profile")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                                Label("Settings", systemImage: "").foregroundColor(Color.white)
                            }
                            
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                                Label("Logout", systemImage: "").foregroundColor(Color.white)
                            }
                            
                        }
                    }.navigationBarTitleDisplayMode(.inline)
                
                Image("profile")
                    .frame(width: 158, height: 158)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10).padding(.bottom,-100)
            }
            VStack{
                Text("Victoria Robertson").font(Font.custom("Inter-SemiBold", size: 30))
                Text("A mantra goes here").font(Font.custom("Inter-SemiBold", size: 16))
                Spacer()
                
                HStack(spacing:0){
                
                    HStack{
                        Text("Posts")
                            .foregroundColor(self.index == 0 ? .green : .gray)
                    }.padding(.vertical, 10)
                        .padding(.horizontal,35)
                        .background((Color.white).opacity(self.index == 0 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            self.index = 0
                        }
                    
                    HStack{
                        Text("Photos")
                            .foregroundColor(self.index == 1 ? .green : .gray)
                    }.padding(.vertical, 10)
                        .padding(.horizontal,35)
                        .background((Color.white).opacity(self.index == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            self.index = 1
                        }
                }.padding(3)
                    .background(Color.black.opacity(0.06))
                    .clipShape(Capsule())
                    Spacer(minLength: 0)
            }.padding(.top,40)
            Spacer()
            ScrollView(.vertical) {
                ForEach(0 ..< 5) { item in
                    HStack(spacing:10){
                        Rectangle()
                            .fill(Color(hex: 0xF6F6F6, alpha: 1))
                            .frame(width: 50, height: 50)
                        VStack(alignment:.leading){
                            HStack {
                                Text("Header").font(Font.custom("Inter-SemiBold", size: 16))
                                Spacer()
                                Text("8 mins ago").font(Font.custom("Inter-Regular", size: 14)).foregroundStyle(Color(hex: 0xBDBDBD, alpha: 1))
                                
                            }
                            Text("He'll want to use your yacht, and I don't want this thing smelling like fish.").font(Font.custom("Inter-Regular", size: 14))
                            Divider()

                        }
                    }.padding()
                }
            }
            Spacer()
            HStack{
                ScrollView(.horizontal) {
                    HStack(){
                        ForEach(0 ..< 5) { item in
                            Circle()
                                .fill(Color(hex: 0xF6F6F6, alpha: 1))
                                .frame(width: 32, height: 32)
                        }.padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}


