//
//  TabView.swift
//  PresentationWork
//
//  Created by Aaban Tariq Murtaza on 20/11/2023.
//

import SwiftUI

struct StudentTabView: View {
    @State var selectedIndex = 0
    @State var showMenu = false
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    TabView(selection: $selectedIndex) {
                        ListView(showMenu: $showMenu)
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Students")
                            }
                            .tag(0)
                        SettingView()
                            .tabItem {
                                Label("Settings", systemImage: "gear")
                            }.tag(1)
                        
                        
                    }
                    SideMenu(isShowing: $showMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedIndex, presentSideMenu: $showMenu)))
                }
                
            }
        }
    }
}

#Preview {
    StudentTabView()
}

