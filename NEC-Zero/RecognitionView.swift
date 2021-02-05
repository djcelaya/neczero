//
//  RecognitionView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/timely-recognition
//
//  Created by David Celaya-Gonzalez on 2/1/21.
//

import SwiftUI

struct RecognitionView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("It is important that healthcare providers caring for neonates...")
                Text("Key Components of Timely Recognition:")
                    .font(.title2)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Risk Awareness")
                        .font(.title3)
                    Text("Awareness of a particular neonate’s risk...")
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Clinical Assessment and Monitoring")
                        .font(.title3)
                    Text("Vigilant assessment and monitoring...")
                        .padding(.bottom, 5)
                    Text("Abdominal/gastrointestinal signs of NEC include...")
                        .padding(.bottom, 5)
                    Text("Non-abdominal signs of NEC include...")
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Effective Communication")
                        .font(.title3)
                    Text("Communication between care providers...")
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Sources")
                        .font(.title3)
                    Text("Christensen, R. D., Wiedmeier, S. E.,...")
                        .padding(.bottom, 5)
                    Text("Gephart, S. M., Wetzel, C.,...")
                        .padding(.bottom, 5)
                    Text("Gregory, K. E., Deforge, C. E.,...")
                        .padding(.bottom, 5)
                }
            }.padding([.leading, .trailing, .bottom])
        }.navigationBarTitle("Timely Recognition")
    }
}

struct RecognitionView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    RecognitionView()
                }.tabItem {
                    VStack {
                        Image(systemName: "book")
                        Text("Resources")
                    }
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
