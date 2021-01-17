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
}
