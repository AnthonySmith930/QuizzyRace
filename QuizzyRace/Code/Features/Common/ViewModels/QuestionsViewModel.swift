//
//  QuestionsViewModel.swift
//  QuizzyRace
//
//  Created by Anthony Smith on 4/12/25.
//

import Foundation
import SwiftUI

class QuestionsViewModel: ObservableObject {
    @Published var questions: [QuestionModel] = []

    func fetchQuestions() {
        TriviaAPI().fetchTrivia { resultData in
            switch resultData {
            case .success(let resultData):
                self.questions = resultData
            case .failure(let error):
                print(error)
            }
        }
    }
}
