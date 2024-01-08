//
//  ProfileView.swift
//  PresentationWork
//
//  Created by Syed Faraz Haider Zaidi on 09/01/2024.
//

import SwiftUI

struct SwiftUIProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()

            Text("First Name: John")
                .padding()
            Text("Last Name: Doe")
                .padding()

            Spacer()
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}
