//
//  ApiCaller.swift
//  GymCompanion
//
//  Created by Fernando Brito on 01/09/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case failedToGetData
    case failedToDecodeData
}

struct ApiCaller {
    static let shared = ApiCaller()

    private init() {}

    private func isValidResponse(_ response: URLResponse) -> Bool {
        let response = response as? HTTPURLResponse

        return response?.statusCode == 200
    }

    public func getExercises(by muscleGroup: MuscleGroup) async -> Result<[Exercise], Error> {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(muscleGroup)") else {
            return .failure(APIError.invalidURL)
        }

        var request = URLRequest(url: url)
        request.setValue(ProcessInfo.processInfo.environment["API_KEY"], forHTTPHeaderField: "X-Api-Key")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard isValidResponse(response) else {
                return .failure(APIError.failedToGetData)
            }

            let decoder = JSONDecoder()
            let result = try decoder.decode([Exercise].self, from: data)

            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
