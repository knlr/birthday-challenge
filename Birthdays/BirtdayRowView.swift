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


    var body: some View {
        NavigationLink( destination: BirthdayDetailView(person: person)) {
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 70, height: 70.0)
                        .padding()

                    Text(person.initials)
                        

                }

                VStack(alignment: .leading) {
                    Text(person.name)
                        .fontWeight(.bold)

                    Text(person.date_of_birth)
                    Spacer()

                }
                .padding()

                Spacer()
            }
            .padding(.leading)
        }
    }
}

struct BirtdayRowView_Previews: PreviewProvider {
    static var previews: some View {
        BirtdayRowView(person: Person(id: "id", name: "Peter", date_of_birth: "1970-01-01"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/414.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
