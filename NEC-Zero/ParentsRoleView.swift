//
//  ParentsRole.swift
//  NEC-Zero
//
//  Correpsonding webpage: https://neczero.nursing.arizona.edu/parent-role
//  Video: https://vimeo.com/210346764/27ade0d432
//
//  Created by David Celaya on 2/1/21.
//

import SwiftUI
import AVKit

struct ParentsRoleView: View {

    let videoURL = URL(string: "https://player.vimeo.com/external/210346764.hd.mp4?" +
                        "s=92799e0c38ab2bb765dcb92d688657f5dd23e728&profile_id=119")
    let player: AVPlayer

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Parents you have an important role...")
                    .padding(.top, 8)
                    .padding([.leading, .trailing])
                VideoPlayer(player: player)
                    .aspectRatio(16.0 / 9.0, contentMode: .fit)
                    .onDisappear() {
                        player.pause()
                    }
                Text("Tip: Write your questions down...")
                    .padding(.top, 8)
                    .padding([.leading, .trailing, .bottom])
            }
        }.navigationBarTitle(Text("Role of Parents"))
    }

    init() {
        player = AVPlayer(url: videoURL!)
    }
}

struct ParentsRole_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    ParentsRoleView()
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
