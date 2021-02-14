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

    @State var keyComponentsIndex = 0 {
        didSet {
            print("keyComponentsIndex = \(keyComponentsIndex)")
        }
    }

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 10) {
                Text("It is important that healthcare providers caring for neonates...")
                Text("Key Components of Timely Recognition:")
                    .font(.title2)
                TabView(selection: $keyComponentsIndex) {
                    CardView(with: "Risk Awareness", and: "Awareness of a particular neonate’s risk...")
//                    Text("Awareness of a particular neonate’s risk...")
//                        .background(Color.blue)
                        .tag(0)
                    CardView(with: "Clinical Assessment and Monitoring", and: "Vigilant assessment and monitoring...")
//                    Text("Vigilant assessment and monitoring...")
                        .tag(1)
                    CardView(with: "Effective Communication", and: "Communication between care providers...")
                        .tag(2)
                }
                .frame(height: 450)
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeOut)
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
            }
            .padding([.leading, .trailing, .bottom])
        }
        .navigationBarTitle("Timely Recognition")
    }
}

struct CardView: View {
    let title: String
    let text: LocalizedStringKey
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(text)
                .foregroundColor(.white)
            Spacer()
        }
//        .frame(width: 300)
        .padding()
        .background(Color("AccentColor"))
        .cornerRadius(20)
    }
    init(with title: String, and text: LocalizedStringKey) {
        self.title = title
        self.text = text
    }
}

struct RecognitionView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en"], id: \.self) { id in
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
