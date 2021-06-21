//
//  PreventionStrategiesView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/prevention
//  Video: https://vimeo.com/210346676/4c5295fb76
//
//  Created by David Celaya-Gonzalez on 6/17/21.
//

import SwiftUI
import AVKit

struct PreventionStrategiesView: View {

    let videoURL = URL(string: "https://player.vimeo.com/external/210346676.hd.mp4" + "?s=54541a13df3054f6550e6ea6f93828ecebb00a47&profile_id=119")

    let player: AVPlayer

    let strategies = [
        "Swabbing the inside cheeks...",
        "Feeding human milk to babies",
        "Limiting the length of time babies are given antibiotics",
        "Following feeding protocols",
        "Communicating and including parents in the care process",
        "Using tools that help recognize signs and symptoms of NEC"
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VideoPlayer(player: player)
                    .aspectRatio(16.0 / 9.0, contentMode: .fit)
                    .onDisappear() {
                        player.pause()
                    }
                Text("Why some babies get NEC while...")
                    .padding(.top, 8)
                    .padding([.leading, .trailing])
            }
        }.navigationBarTitle("Prevention Strategies")
    }

    init() {
        player = AVPlayer(url: videoURL!)
    }
}

struct PreventionStrategiesView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                PreventionStrategiesView()
            }.tabItem {
                VStack {
                    Image(systemName: "book")
                    Text("Resources")
                }
            }
        }
    }
}
