//
//  Webinars.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 6/15/21.
//

import Foundation
import Combine

final class Webinars: ObservableObject {

    @Published private(set) var webinars: [Webinar]

    static let pastWebinars = [
        Webinar(
            title: "Fragile Infants: Evidence-Based Resources to Help Parents and Providers",
            purpose: "Disseminate consumer level information...",
            url: URL(string: "https://player.vimeo.com/external/264100505.sd.mp4"
                     + "?s=023ae49102c59366d34dd80af762343f5ca43eac&profile_id=165")!),
        Webinar(
            title: "NEC-Zero Evidence-Based Resources to Prevent Complications in Fragile Infants",
            purpose: "Disseminate clinical information about...",
            url: URL(string: "https://player.vimeo.com/external/269740659.hd.mp4"
                     + "?s=4994e14438365d6147cb59b19de0a1bcfa4be5d9&profile_id=175")!)
    ]

    init() {
        webinars = Array<Webinar>()
        webinars.append(Webinars.pastWebinars[0])
        webinars.append(Webinars.pastWebinars[1])
    }
}

struct Webinar: Identifiable {
    let title: String
    let purpose: String
    var id: String { title }
    let url: URL
}
