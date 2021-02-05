//
//  NECZeroView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/about
//  Video: https://vimeo.com/210346353/7d5ccff668
//
//  Created by David Celaya-Gonzalez on 1/26/21.
//

import SwiftUI
import AVKit

struct NECZeroView: View {

    let videoURL = URL(string: "https://player.vimeo.com/external/210346353.hd.mp4" +
                        "?s=6e2019548e85bb6d7ca324476e70037975c0f52b&profile_id=119")
    let player: AVPlayer

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("NEC-Zero is an intervention that...")
                    .padding([.leading, .trailing, .top])
                VideoPlayer(player: player)
                    .aspectRatio(16.0 / 9.0, contentMode: .fit)
                    .onDisappear() {
                        player.pause()
                    }
                Text("Who is funding the project?")
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
                Text("The Agency for Healthcare Research and Quality and...")
                    .padding(.top, 4)
                    .padding([.leading, .trailing])
                Text("Who is the target population?")
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
                Text("Babies targeted to receive NEC-Zero are...")
                    .padding(.top, 4)
                    .padding([.leading, .trailing])
                Text("What clinical practices are included?")
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
                Text("The intervention integrates...")
                    .padding(.top, 4)
                    .padding([.leading, .trailing])
                LazyVGrid(columns: columns) {
                    Text("1.")
                    Text("Strategies to promote babies being fed human milk...")
                    Text("2.")
                    Text("Using a tool to support timely recognition...")
                    Text("3.")
                    Text("Limiting the length of time antibiotics...")
                    Text("4.")
                    Text("Promoting adherence...")
                }.padding([.leading, .trailing, .bottom])
            }
        }.navigationTitle("What is NEC-Zero?")
    }

    init() {
        player = AVPlayer(url: videoURL!)
    }
}

struct NECZeroView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    NECZeroView()
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
