//
//  Person.swift
//  Birthdays
//
//  Created by Knut Lorenzen on 17/01/2021.
//  Copyright © 2021 anonoymous. All rights reserved.
//

import Foundation


struct Person : Decodable, Identifiable {

    let id: String
    let name: String
    let date_of_birth: String

    var initials: String {
        name.components(separatedBy: " ").map{ $0.prefix(1).capitalized }.joined()
    }

    var age: Int {

        guard let birthDate = Self.dateFormatter.date(from: date_of_birth) else { return 0 }
        return Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
    }


    private static var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
}
