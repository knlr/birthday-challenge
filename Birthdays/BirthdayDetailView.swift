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
        VStack(spacing: 0.0) {
            ZStack {
                Circle()
                    .fill(Color.gray)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 120)

                Text(person.initials)
                    .font(.system(size: 64))
            }
            .padding(.top, 39)
            .padding(.bottom, 27)

            Text(person.name.components(separatedBy: " ").first ?? "")
                .font(.system(size: 36))
                .padding(.bottom, 15)
            Text("\(person.age) years old".uppercased())
                .font(.system(size: 13))
                .padding(.bottom, 32)

            HStack {
                Spacer(minLength: 16)
                Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    } ) {
                        Text("GO BACK")
                            .foregroundColor(Color.white)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 52.0)
                .background(Color.black)
                Spacer(minLength: 16)
            }


            Spacer()
        }.navigationBarBackButtonHidden(true)
    }
}

struct BirthdayDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayDetailView(person: Person(id: "id", name: "Peter", date_of_birth: "1970-01-01"))
    }
}
