//
//  BreastfeedingView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/breastfeeding
//
//  Created by David Celaya-Gonzalez on 6/2/21.
//

import SwiftUI

struct BreastfeedingView: View {

    let benefits = [
        "lower the chances of developing NEC",
        "protect the baby from infection",
        "control the baby's inflammatory response",
        "mature the premature gut",
        "feedings be tolerated"
    ]

    static let breastfeedingResources = [
        WebLink(
            title: "La Leche League",
            url: "https://www.llli.org",
            description: "Offers multi-language breastfeeding..."),
        WebLink(
            title: "MedlinePlus",
            url: "https://medlineplus.gov/breastfeeding.html",
            description: "Offers breastfeeding information in many..."),
        WebLink(
            title: "Womenshealth.gov",
            url: "https://www.womenshealth.gov/itsonlynatural/planning-ahead/benefits-of-breastfeeding.html",
            description: "offers videos and support resources...")
    ]

    static let familyResources = [
        WebLink(
            title: "Healthychildren.org",
            url: "https://www.healthychildren.org/English/ages-stages/baby/breastfeeding/Pages/default.aspx",
            description: "Provides many topics that are..."),
        WebLink(
            title: "LactMed",
            url: "https://www.ncbi.nlm.nih.gov/books/NBK501922/",
            description: "A database on drugs and lactation...")
    ]

    static let breastfeedingExamples = [
        WebLink(
            title: "A Breastfeeding Checklist: Are You Nursing Correctly?",
            url: "https://www.healthychildren.org/english/ages-stages/baby/breastfeeding/pages/a-breastfeeding-checklist-are-you-nursing-correctly.aspx",
            description: "(English and Spanish including audio)"),
        WebLink(
            title: "Benefits of Breastfeeding for Mom",
            url: "https://www.healthychildren.org/English/ages-stages/baby/breastfeeding/Pages/Benefits-of-Breastfeeding-for-Mom.aspx",
            description: "(English and Spanish including audio)"),
        WebLink(
            title: "Colostrum: Your Baby’s First Meal",
            url: "https://www.healthychildren.org/English/ages-stages/baby/breastfeeding/Pages/Colostrum-Your-Babys-First-Meal.aspx",
            description: "(English and Spanish including audio)")
    ]

    static let preemieExamples = [
        WebLink(
            title: "About Skin-to-Skin Care",
            url: "https://www.healthychildren.org/english/ages-stages/baby/preemie/pages/about-skin-to-skin-care.aspx",
            description: "(English and Spanish including audio)"),
        WebLink(
            title: "Watching for Complications",
            url: "https://www.healthychildren.org/English/ages-stages/baby/preemie/Pages/Watching-for-Complications.aspx",
            description: "(English and Spanish including audio)")
    ]

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]

    var body: some View {
        ScrollView(.vertical) {
            intro
            workplace
            LinkList(title: "Breastfeeding Resources", links: BreastfeedingView.breastfeedingResources)
            LinkList(title: "Family Resources", links: BreastfeedingView.familyResources)
            LinkList(title: "Breastfeeding Topic Examples", links: BreastfeedingView.breastfeedingExamples)
            LinkList(title: "Preemie Topic Examples", links: BreastfeedingView.preemieExamples)
        }.navigationBarTitle("Breastfeeding")
    }

    var intro: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            Text("There are many reasons feeding...")
            Text("Feeding breast milk to a premature baby helps")
            LazyVGrid(columns: columns) {
                Text("•")
                Text("lower the chances of developing NEC")
                Text("•")
                Text("protect the baby from infection")
                Text("•")
                Text("control the baby's inflammatory response")
                Text("•")
                Text("mature the premature gut")
                Text("•")
                Text("feedings be tolerated")
            }
            List {
                Text("lower the chances of developing NEC")
                Text("protect the baby from infection")
                Text("control the baby's inflammatory response")
            }.listStyle(InsetGroupedListStyle())
            Text("The importance of colostrum...")
        }.padding([.leading, .trailing])
    }

    var workplace: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            Text("Breastfeeding and the Workplace")
                .font(.title2)
            Text("Increasingly employers are supporting breastfeeding...")
            Text("In 2010, the Patient Protection...")
        }.padding([.leading, .trailing])
    }
}

struct Breastfeeding_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView() {
                BreastfeedingView()
            }
        }
    }
}
