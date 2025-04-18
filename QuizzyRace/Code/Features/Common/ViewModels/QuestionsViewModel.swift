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
        TriviaAPI().fetchTrivia { result in
            switch result {
            case .success(let resultData):
                self.questions = resultData.results
            case .failure(let error):
                print(error)
            }
        }
    }
}
