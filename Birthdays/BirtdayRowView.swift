//
//  BirtdayRowView.swift
//  Birthdays
//
//  Created by Knut Lorenzen on 17/01/2021.
//  Copyright © 2021 anonoymous. All rights reserved.
//

import SwiftUI

struct BirtdayRowView: View {

    var person: Person
    var initials: String { person.name.components(separatedBy: " ").map{ $0.prefix(1).capitalized }.joined()
    }

    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                Circle().fill(Color.gray)

                Text(initials)
                    .font(.largeTitle)

            }.padding()

            VStack(alignment: .leading) {
                Text(person.name)
                    .fontWeight(.bold)
                    .padding(.top)

                Text(person.date_of_birth)
                    .padding(.top, 0.0)
            }
            .padding()
        }
    }
}

struct BirtdayRowView_Previews: PreviewProvider {
    static var previews: some View {
        BirtdayRowView(person: Person(name: "Peter", date_of_birth: "01-01-1970"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/414.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
