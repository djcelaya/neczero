//
//  NZView.swift
//  NEC-Zero
//
//  Created by David Celaya on 6/29/21.
//

import SwiftUI

struct NZView<Content>: View where Content: View {

    var hasAcceptedDisclaimer: Bool { UserDefaults.standard.bool(forKey: "Disclaimer") }
    @State var isPresentingDisclaimer = false
    var content: Content

    var body: some View {
        content
            .sheet(isPresented: $isPresentingDisclaimer, content: {
                DisclaimerView($isPresentingDisclaimer)
            })
    }

        init(content: @escaping () -> Content) {
            self.content = content()
        }
}

//struct NECView2: NZView<<#Content: View#>> {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}

struct NZView_Previews: PreviewProvider {
    static var previews: some View {
        NZView {
            Text("Hello, World!")
        }
    }
}

extension View where Body: View {

    var hasAcceptedDisclaimer: Bool { UserDefaults.standard.bool(forKey: "Disclaimer") }

    var isPresentingDisclaimer: Bool {
        return false
    }

//    var protectedBody: Body {
//
//    }

//    var body: some View {
//        Body
//    }
    
}

extension Button {

}


