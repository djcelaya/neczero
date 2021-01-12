//
//  GutCheckNECViewModel.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 1/6/21.
//

import SwiftUI

class GutCheckNECViewModel: ObservableObject {

    private var gutCheckNEC: GutCheckNEC

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
                gutCheckNEC.race = GutCheckNEC.Race.black
            } else if raceIndex == 1 {
                gutCheckNEC.race = GutCheckNEC.Race.hispanic
            } else {
                gutCheckNEC.race = GutCheckNEC.Race.other
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


    init(with model: GutCheckNEC) {
        gutCheckNEC = model
    }
}
