//
//  NECView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/what-is-nec
//  Video: https://vimeo.com/210346530/923257335b
//
//  Created by David Celaya-Gonzalez on 1/26/21.
//

import SwiftUI
import AVKit

struct NECView: View {

//    var hasAcceptedDisclaimer: Bool { UserDefaults.standard.bool(forKey: "Disclaimer") }
//    @State var isPresentingDisclaimer = false

    let videoURL = URL(string: "https://player.vimeo.com/external/210346530.hd.mp4" +
                        "?s=df32aae873983d6fd0d36b993ba7cef345eefef0&profile_id=119")
    let player: AVPlayer

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Necrotizing enterocolitis (nek-roh-TIE-zing en-ter-oh-coh-LIE-tis)...")
                    .padding(.top, 8)
                    .padding([.leading, .trailing])
                VideoPlayer(player: player)
                    .aspectRatio(16.0 / 9.0, contentMode: .fit)
                    .onDisappear() {
                        player.pause()
                    }
                Text("This infection can cause damage to the bowel over time...")
                    .padding(.top, 8)
                    .padding([.leading, .trailing])
                Text("Often NEC impacts babies who are born very early and very small...")
                    .padding(.top, 8)
                    .padding([.leading, .trailing])
                Image("Kangaroo Care")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("The chance of your baby developing NEC is low...")
                    .padding(.top, 8)
                    .padding([.leading, .trailing])
                Text("Sometimes parents and family members...")
                    .padding(.top, 8)
                    .padding([.leading, .trailing, .bottom])
            }
        }
        .navigationBarTitle("What is NEC?")
//        .sheet(isPresented: $isPresentingDisclaimer, content: {
//            DisclaimerView($isPresentingDisclaimer)
//        })
    }

    init() {
        player = AVPlayer(url: videoURL!)
    }
}

struct NECView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    NECView()
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
