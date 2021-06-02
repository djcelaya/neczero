//
//  HospitalView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/caring-babies-nec-hospital
//
//  Created by David Celaya-Gonzalez on 6/2/21.
//

import SwiftUI

struct HospitalView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HospitalView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView() {
                HospitalView()
            }
        }
    }
}
