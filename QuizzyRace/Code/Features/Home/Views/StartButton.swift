//
//  StartButton.swift
//  QuizzyRace
//
//  Created by Anthony Smith on 4/14/25.
//

import SwiftUI

struct ThreeD: ButtonStyle {
    let offset: CGFloat = 5.0
    let buttonColor: Color = .init(red: 0.7137, green: 0.3725, blue: 0.7843)
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundColor(.black)
                .offset(y: offset)
            Circle()
                .foregroundColor(buttonColor)
                .offset(y: configuration.isPressed ? offset : 0)
            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
                .font(.largeTitle)
        }
        .compositingGroup()
        .shadow(
            radius: configuration.isPressed ? 1 : 6,
            y: configuration.isPressed ? 1 : 6
        )
    }
}

struct StartButton: View {
    @ObservedObject var viewModel = QuestionsViewModel()
    var body: some View {
        Button("Start Quiz") { viewModel.fetchQuestions() }
        .foregroundColor(.white)
        .frame(width: 200, height: 200)
        .buttonStyle(ThreeD())
    }
}

#Preview {
    StartButton()
}
