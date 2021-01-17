//
//  BirthDayRESTClient.swift
//  Birthdays
//
//  Created by Knut Lorenzen on 17/01/2021.
//  Copyright © 2021 anonoymous. All rights reserved.
//

import Foundation


final class BirthdayRESTClient {

    enum Error: Swift.Error {
        case noData
        case connectivity
    }



    static func getPeopleList(completion: @escaping (Result<[Person], Error>) -> Void) {


        var request = URLRequest(url: URL(string: "https://birthday-api.hasura.app/v1/graphql")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let queryDict = ["query": """
            query {
                person {
                    name
                    date_of_birth
                    }
            }
            """]
        request.httpBody = try! JSONSerialization.data(withJSONObject: queryDict, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, _) in

            var result: Result<[Person], Error> = .failure(.noData)

            struct Response: Decodable {
                let data: PersonData?
                struct PersonData: Decodable {
                    let person: [Person]?
                }
            }
            if response == nil {

                result = .failure(.connectivity)
            }
            if let data = data {

                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    if let persons = response.data?.person, !persons.isEmpty {
                        result = .success(persons)
                    }
                }
                catch {
                    result = .failure(.noData)
                }
            }
            DispatchQueue.main.async {
                completion(result)
            }

        }.resume()
    }
}

