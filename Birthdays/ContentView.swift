//
//  ContentView.swift
//  Birthdays
//
//  Created by Knut Lorenzen on 16/01/2021.
//  Copyright © 2021 anonoymous. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var showLoadingState: Bool
    var persons: [Person]
    var body: some View {

        if showLoadingState {
            ProgressView()
        }
        else {
            List {
                ForEach(persons) { person in
                    BirtdayRowView(person: person)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        let fileURL = Bundle.main.url(forResource: "SampleResponse", withExtension: "json")!
        let data = try! Data(contentsOf: fileURL)
        let persons = try! JSONDecoder().decode([Person].self, from: data)

        ContentView(showLoadingState: false, persons: persons)
    }
}
