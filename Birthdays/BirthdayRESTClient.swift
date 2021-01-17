//
//  BirthDayRESTClient.swift
//  Birthdays
//
//  Created by Knut Lorenzen on 17/01/2021.
//  Copyright © 2021 anonoymous. All rights reserved.
//

import Foundation
import GraphQL_Swift


final class BirthdayRESTClient {

    static private let controller = GQLNetworkController(apiDefinition: BirthdayGQLAPIDefinition())


    static func getPeopleList(completion: @escaping (Result<[Person], Error>) -> Void) {

        struct BirthdayGQLQuery : GQLQuery {
            var graphQLLiteral: String {
                return """
                query {
                    person {
                        name
                        date_of_birth
                        }
                    }
                """
            }
            var variables: [String : Any]?
            var fragments: [GQLFragment]?
        }
        do {
            try controller.makeGraphQLRequest(BirthdayGQLQuery(), returnQueue: .main) { results in

                switch results {

                case .fail(let error):()
                case .success(let dictionary): ()
                }
//                JSONDecoder().decode([Person].self, from: results)
            }
        }
        catch {

        }
    }
}


private extension BirthdayRESTClient {

    struct BirthdayGQLAPIDefinition : GQLAPIDefinition {
        var authorization: GQLAuthorization?
        var rootRESTURLString: String { return "https://birthday-api.hasura.app/v1/graphql" }
        var rootWebsocketURLString: String { return "" }
    }
}
