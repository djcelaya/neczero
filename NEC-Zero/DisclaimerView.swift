//
//  DisclaimerView.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 3/29/21.
//

import SwiftUI

struct DisclaimerView: View {

    @State private var hasAcceptedDisclaimer = UserDefaults.standard.bool(forKey: "Disclaimer")
    @State private var dateAccepted: Date?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("The material provided in this mobile application is for...")
                    .padding()
                Button(action: {
                    hasAcceptedDisclaimer = true
                    UserDefaults.standard.setValue(hasAcceptedDisclaimer, forKey: "Disclaimer")
                    dateAccepted = Date()
                    UserDefaults.standard.setValue(dateAccepted, forKey: "DisclaimerDate")
                }, label: {
                    VStack(alignment: .leading) {
                        Text("I have read and accept the disclaimer above.")
                        if hasAcceptedDisclaimer {
                            if let date = dateAccepted {
                                Text("Disclaimer accepted on \(date.asString())")
                            }
                        }
                    }
                })
                .disabled(hasAcceptedDisclaimer) // once accepted, cannot unaccept
                .padding()
//                .background(Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 1))
            }
        }.navigationTitle("Disclaimer")
    }

    init() {
        if let date = UserDefaults.standard.object(forKey: "DisclaimerDate") as! Date? {
            _dateAccepted = State(initialValue: date)
        }
    }
}

extension Date {
    func asString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: self)
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView() {
                DisclaimerView()
            }.tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("More")
                }
            }
        }
    }
}
