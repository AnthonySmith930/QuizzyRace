//
//  QuestionModel.swift
//  QuizzyRace
//
//  Created by Anthony Smith on 4/12/25.
//

import Foundation

struct QuestionsResponse: Decodable {
    let responseCode: Int?
    let results: [QuestionModel]?

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

struct QuestionModel: Decodable {
    var type: String?
    var difficulty: Difficulty?
    var category: String?
    var question: String?
    var correctAnswer: String?
    var incorrectAnswers: [String]?

    enum CodingKeys: String, CodingKey {
        case type
        case difficulty
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum Difficulty: String, Decodable {
    case easy
    case medium
    case hard
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let difficulty =
            try? container.decode(String.self),
            let val = Difficulty(rawValue: difficulty) {
                self = val
            } else {
                self = .unknown
            }
    }
}
