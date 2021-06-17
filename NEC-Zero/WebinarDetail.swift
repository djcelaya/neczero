//
//  WebinarDetail.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/health-professional-resources
//
//  Created by David Celaya-Gonzalez on 6/15/21.
//

import SwiftUI
import AVKit

struct WebinarDetail: View {

    let webinar: Webinar
    let player: AVPlayer

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VideoPlayer(player: player)
                    .aspectRatio(16.0 / 9.0, contentMode: .fit)
                    .onDisappear() {
                        player.pause()
                    }

                Text(webinar.title)
                    .font(.title2)
                    .bold()
                    .padding([.top, .leading, .trailing])
                    .padding(.bottom, 3)
                Text(webinar.purpose)
                    .padding([.leading, .trailing, .bottom])
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }

    init(_ webinar: Webinar) {
        self.webinar = webinar
        player = AVPlayer(url: webinar.url)
    }
}

struct WebinarView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView() {
                WebinarDetail(Webinars.pastWebinars[0])
            }.tabItem {
                VStack {
                    Image(systemName: "book")
                    Text("Resources")
                }
            }
        }
    }
}
