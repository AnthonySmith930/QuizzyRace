//
//  BottomBarItems.swift
//  QuizzyRace
//
//  Created by Anthony Smith on 4/13/25.
//

import SwiftUI

struct BottomBarItems: View {
    let iconColor: Color = .init(red: 0.9725, green: 0.6078, blue: 0.8666)
    var body: some View {
        HStack {
            Spacer()
            Button("History", systemImage: "clock") {
                print("Hello world!")
            }
            .labelStyle(.iconOnly)
            .foregroundColor(iconColor)
            Spacer()
            Spacer()
            Button("Settings", systemImage: "gearshape") {
                print("Hello world!")
            }
            .labelStyle(.iconOnly)
            .foregroundColor(iconColor)
            Spacer()
        }
    }
}

#Preview {
    BottomBarItems()
}
