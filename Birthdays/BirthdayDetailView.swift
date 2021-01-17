//
//  BirthdayDetailView.swift
//  Birthdays
//
//  Created by Knut Lorenzen on 17/01/2021.
//  Copyright © 2021 anonoymous. All rights reserved.
//

import SwiftUI

struct BirthdayDetailView: View {

    var person: Person
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.gray)
                    .padding(.horizontal, 100)

                Text(person.initials)
                    .font(.largeTitle)
            }
            Text(person.name.components(separatedBy: " ").first ?? "")
            Text("\(person.age) years old".uppercased())
            Button(action: {
                self.presentationMode.wrappedValue.dismiss() 
            } ) {
                Text("GO BACK")
            }

        }.navigationBarBackButtonHidden(true)
    }
}

struct BirthdayDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayDetailView(person: Person(id: "id", name: "Peter", date_of_birth: "1970-01-01"))
    }
}
