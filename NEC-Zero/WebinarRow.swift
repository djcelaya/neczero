//
//  WebinarRow.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 6/16/21.
//

import SwiftUI

struct WebinarRow: View {

    let webinar: Webinar

    var body: some View {
        HStack {
            webinar.image
                .resizable()
                .frame(width: 64, height: 36)
            Text(webinar.title)
            Spacer()
        }
    }
}

struct WebinarRow_Previews: PreviewProvider {
    static var previews: some View {
        WebinarRow(webinar: Webinars.pastWebinars[0])
    }
}
