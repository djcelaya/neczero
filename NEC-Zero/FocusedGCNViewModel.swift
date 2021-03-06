//
//  FocusedGCNViewModel.swift
//  NEC-Zero
//
//  View model for focused GutCheckNEC (GCN) risk assessment model.
//
//  Created by David Celaya-Gonzalez on 1/6/21.
//

import Combine

class FocusedGCNViewModel: ObservableObject {

    private var gutCheckNEC: FocusedGutCheckNEC
    @Published private(set) var questions: [Question]

    let gestationalAgeOptions = [
        "<28",
        "28-31 6/7",
        ">= 32"
    ]

    @Published var gestationalAgeIndex = 1 {
        didSet {
            if gestationalAgeIndex == 0 {
                gutCheckNEC.gestationAge = 27
            } else if gestationalAgeIndex == 1 {
                gutCheckNEC.gestationAge = 28
            } else {
                gutCheckNEC.gestationAge = 32
            }

        }
    }

    let raceOptions = [
        "Black",
        "Hispanic",
        "Other races"
    ]

    @Published var raceIndex = 1 {
        didSet {
            if raceIndex == 0 {
                gutCheckNEC.race = FocusedGutCheckNEC.Race.black
            } else if raceIndex == 1 {
                gutCheckNEC.race = FocusedGutCheckNEC.Race.hispanic
            } else {
                gutCheckNEC.race = FocusedGutCheckNEC.Race.other
            }
        }
    }

    @Published var outborn = false {
        didSet {
            gutCheckNEC.outborn = outborn
        }
    }

    let necRateOptions = [
        "2-4.99%",
        "5-7.99%",
        "8-11.99%",
        "> 12%"
    ]

    @Published var necRateIndex = 1 {
        didSet {
            if necRateIndex == 0 {
                gutCheckNEC.necRate = 2
            } else if necRateIndex == 1 {
                gutCheckNEC.necRate = 6
            } else if necRateIndex == 2 {
                gutCheckNEC.necRate = 10
            } else { // necRateIndex = 3
                gutCheckNEC.necRate = 13
            }
        }
    }

    @Published var milkFeeding = true {
        didSet {
            gutCheckNEC.humanMilkFeeding = milkFeeding
        }
    }

    @Published var probiotics = true {
        didSet {
            gutCheckNEC.probiotics = probiotics
        }
    }

    let infectionsOptions = [
        "One",
        "Two",
        "None"
    ]

    @Published var infectionsIndex = 0 {
        didSet {
            if infectionsIndex == 0 {
                gutCheckNEC.infections = 1
            } else if infectionsIndex == 1 {
                gutCheckNEC.infections = 2
            } else {
                gutCheckNEC.infections = 0
            }
        }
    }

    @Published var prbcTransfusion = false {
        didSet {
            gutCheckNEC.prbcTransfusion = prbcTransfusion
        }
    }

    @Published var hypotension = false {
        didSet {
            gutCheckNEC.hypotension = hypotension
        }
    }

    @Published var metabolicAcidosis = false {
        didSet {
            gutCheckNEC.metabolicAcidosis = metabolicAcidosis
        }
    }

    @Published var points = 0

    func submit() {
        points = gutCheckNEC.points
    }


    init(with model: FocusedGutCheckNEC = FocusedGutCheckNEC()) {
        gutCheckNEC = model
        questions = [
            Question(
                title: "Gestational age (weeks)",
                description: "Calculate GA in weeks at birth...",
                responses: [
                    Question.Response(
                        displayValue: "<28",
                        points: 9
                    ),
                    Question.Response(
                        displayValue: "28-31 6/7",
                        points: 8
                    ),
                    Question.Response(
                        displayValue: "≥ 32",
                        points: 0
                    )
                ]
            ),
            Question(
                title: "Race",
                responses: [
                    Question.Response(displayValue: "Black", points: 2),
                    Question.Response(displayValue: "Hispanic", points: 2),
                    Question.Response(displayValue: "Other races", points: 0)
                ]
            ),
            Question(
                title: "Outborn",
                description: "Yes if the infant is transferred into this center...",
                responses: [
                    Question.Response(displayValue: "Yes", points: 3),
                    Question.Response(displayValue: "No", points: 0)
                ]
            )
        ]
    }

    // what if you didn't do it with structs...how about a dictionary? or some key-val lookup?
    struct Question: Identifiable {
        let title: String
        private(set) var description: String?
        let responses: [Response]
//        var selectedResponseIndex: Int?
        var id: String { title }

        struct Response: Identifiable {
            let displayValue: String
            let points: Int
//            var isSelected: Bool = false
            var id: String { displayValue }
        }
    }

}
