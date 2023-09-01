//
//  ApiCaller.swift
//  GymCompanion
//
//  Created by Fernando Brito on 01/09/23.
//

import Foundation

struct Constants {
    static let API_KEY = ""
}

enum APIError: Error {
    case invalidURL
    case failedToGetData
    case failedToDecodeData
}

struct ApiCaller {
    static let shared = ApiCaller()

    private init() {}

    public func getExercises(by muscleGroup: MuscleGroup) async throws -> [Exercise] {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(muscleGroup)") else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.setValue(Constants.API_KEY, forHTTPHeaderField: "X-Api-Key")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.failedToGetData
        }

        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode([Exercise].self, from: data)

            return result
        } catch {
            throw APIError.failedToDecodeData
        }
    }
}
