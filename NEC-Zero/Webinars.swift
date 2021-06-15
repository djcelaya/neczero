//
//  Webinars.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 6/15/21.
//

import SwiftUI

class Webinars: ObservableObject {

    @Published private(set) var webinars: [Webinar]

//    static let pastWebinars = [
//        Webinar(
//            title: "Fragile Infants: Evidence-Based Resources to Help Parents and Providers",
//            purpose: "Disseminate consumer level information...",
//            url: <#T##URL#>)
//    ]

    init() {
        webinars = Array<Webinar>()

    }
}

struct Webinar: Identifiable {
    let title: String
    let purpose: String
    var id: String { title }
    let url: URL
}
