//
//  GutCheckNECTests.swift
//  NEC-ZeroTests
//
//  Created by David Celaya-Gonzalez on 1/11/21.
//

import XCTest
@testable import NEC_Zero

class GutCheckNECTests: XCTestCase {

    // A test to check point tabulation for some "default" values.
    // gestationAge = 28        +8
    // race = hispanic          +2
    // outborn = NO             +0
    // necRate = 6              +16
    // milkFeeding = YES        -3
    // probiotics = YES         -5
    // infections = 1           +4
    // prbcTransfusion = NO     +0
    // hypotension = NO         +0
    // metabolicAcidosis = NO   +0
    // total                    22
    func testGutCheckNecDefaults() {
        let gutCheckNEC = FocusedGutCheckNEC()
        let expectedPoints = 22
        let actualPoints = gutCheckNEC.points
        XCTAssertEqual(expectedPoints, actualPoints)
    }

    // A test to check point tabulation while aiming for the least amount of points possible.
    // gestationAge = 32        +0
    // race = other             +0
    // outborn = NO             +0
    // necRate = 2              +9
    // milkFeeding = YES        -3
    // probiotics = YES         -5
    // infections = 0           +0
    // prbcTransfusion = NO     +0
    // hypotension = NO         +0
    // metabolicAcidosis = NO   +0
    // total                    1
    func testGutCheckNECMinimumPoints() {
        let gutCheckNEC = FocusedGutCheckNEC(
            gestationAge: 32,
            race: FocusedGutCheckNEC.Race.other,
            outborn: false,
            necRate: 2,
            humanMilkFeeding: true,
            probiotics: true,
            infections: 0,
            prbcTransfusion: false,
            hypotension: false,
            metabolicAcidosis: false)
        let expectedPoints = 1
        let actualPoints = gutCheckNEC.points
        XCTAssertEqual(expectedPoints, actualPoints)
    }

    // A test to check point tabulation while aiming for the greatest amount of points possible.
    // gestationAge = 27        +9
    // race = black             +2
    // outborn = YES            +3
    // necRate = 13             +23
    // milkFeeding = NO         +0
    // probiotics = NO          +0
    // infections = 2           +6
    // prbcTransfusion = YES    +8
    // hypotension = YES        +4
    // metabolicAcidosis = YES  +3
    // total                    58
    func testGutCheckNECMaximumPoints() {
        let gutCheckNEC = FocusedGutCheckNEC(
            gestationAge: 27,
            race: FocusedGutCheckNEC.Race.black,
            outborn: true,
            necRate: 13,
            humanMilkFeeding: false,
            probiotics: false,
            infections: 2,
            prbcTransfusion: true,
            hypotension: true,
            metabolicAcidosis: true)
        let expectedPoints = 58
        let actualPoints = gutCheckNEC.points
        XCTAssertEqual(expectedPoints, actualPoints)
    }

    // A test to check point tabulation while aiming for a total in the "low risk" category.
    func testGutCheckNECLowRisk() {

    }

    // A test to check point tabulation while aiming for a total in the "moderate risk" category.
    func testGutCheckNECModerateRisk() {

    }

    // A test to check point tabulation while aiming for a total in the "high risk" category.
    func testGutCheckNECHighRisk() {

    }

    // A test to check point tabulation while aiming for a total in the "very high risk" category.
    func testGutCheckNECVeryHighRisk() {

    }
}
