//
//  WebinarList.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/health-professional-resources
//
//  Created by David Celaya-Gonzalez on 6/15/21.
//

import SwiftUI

struct WebinarList: View {

    @ObservedObject var webinars: Webinars = Webinars()

    var body: some View {
        List {
            ForEach(webinars.webinars) { webinar in
                NavigationLink(destination: WebinarDetail(webinar)) {
                    WebinarRow(webinar: webinar)
//                        .navigationBarTitle("")
//                        .navigationBarHidden(true)
                }
            }
        }.navigationTitle("Webinars")
    }
}

struct WebinarList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WebinarList()
        }
    }
}
