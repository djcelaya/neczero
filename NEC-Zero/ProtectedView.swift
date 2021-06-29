//
//  ProtectedView.swift
//  NEC-Zero
//
//  A view container that serves as a type of middleware protection. The ProtectedView shows
//
//  Created by David Celaya-Gonzalez on 4/19/21.
//

import SwiftUI

//struct ProtectedView<Content>: View where Content: View {
//
//    var hasAcceptedDisclaimer: Bool { UserDefaults.standard.bool(forKey: "Disclaimer") }
//    @State var isPresentingDisclaimer = false
//    var content: Content
//
//    var body: some View {
//        content
//            .sheet(isPresented: $isPresentingDisclaimer, content: {
//                DisclaimerView($isPresentingDisclaimer)
//            })
//    }
//
//    func shouldPresentDisclaimer() -> Bool {
//        if hasAcceptedDisclaimer {
//            return false
//        }
//    }
//
//    init(content: @escaping () -> Content) {
//        self.content = content()
//    }
//}
//
//struct ProtectedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProtectedView {
//            Text("Hello, World!")
//        }
//    }
//}

struct Protected: ViewModifier {
    var hasAcceptedDisclaimer: Bool { UserDefaults.standard.bool(forKey: "Disclaimer") }
    @State var isPresentingDisclaimer = false
    func body(content: Content) -> some View {
        content
    }
}

//protocol Protected {
//
//}

//extension NavigationLink {
//    
//}
