//
//  SampleAction.swift
//  QuizzyRace
//
//  Created by Anthony Smith on 4/12/25.
//

import Foundation

struct TriviaAPI {
    private let scheme: String = "https"
    private let host: String = "opentdb.com"
    private let path = "/api.php"
    
    func fetchTrivia(completion: @escaping (Result<QuestionsResponse, Error>) -> Void) {
        // TODO: probably want this setup stuff moved to a private function for other api requests
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [URLQueryItem(name: "amount", value: String(10))]
        guard let url = components.url else {return}

        var request = URLRequest(url: url)
        request.httpMethod = "get"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }

            if let data = data {
                do {
                    let responseData = try JSONDecoder().decode(QuestionsResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(responseData))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else {
                if let error = error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
