//
//  HomeScreen.swift
//  QuizzyRace
//
//  Created by Anthony Smith on 4/12/25.
//

import SwiftUI

struct HomeScreen: View {
    let backgroundColor: Color =
        .init(red: 0.1725, green: 0.1255, blue: 0.5059)
    var body: some View {
        NavigationView {
            ZStack {
                Color(backgroundColor).ignoresSafeArea()
                StartButton()
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            BottomBarItems()
                        }
                    }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
