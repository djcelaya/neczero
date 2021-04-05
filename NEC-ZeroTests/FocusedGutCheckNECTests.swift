//
//  FocusedGutCheckNECTests.swift
//  NEC-ZeroTests
//
//  Unit tests for the FocusedGutCheckNEC model.
//
//  Created by David Celaya-Gonzalez on 1/11/21.
//

import XCTest
@testable import NEC_Zero

class FocusedGutCheckNECTests: XCTestCase {

//    var gutCheckNEC: FocusedGutCheckNEC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        gutCheckNEC = FocusedGutCheckNEC()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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
        var gutCheckNEC = FocusedGutCheckNEC()
        gutCheckNEC.age = 29
        gutCheckNEC.race = .hispanic
        gutCheckNEC.outborn = false
        gutCheckNEC.necRate = 6
        gutCheckNEC.humanMilkFeeding = true
        gutCheckNEC.probiotics = true
        gutCheckNEC.infections = 1
        gutCheckNEC.prbcTransfusion = false
        gutCheckNEC.hypotension = false
        gutCheckNEC.metabolicAcidosis = false
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
            age: 32,
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
            age: 27,
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
    // gestationAge = 34        +0
    // race = black             +2
    // outborn = NO             +0
    // necRate = 7              +16
    // milkFeeding = NO         +0
    // probiotics = NO          +0
    // infections = 0           +0
    // prbcTransfusion = NO     +0
    // hypotension = NO         +0
    // metabolicAcidosis = NO   +0
    // total                    18
    func testGutCheckNECLowRisk() {
        var gutCheckNEC = FocusedGutCheckNEC()
        gutCheckNEC.age = 34
        gutCheckNEC.race = .black
        gutCheckNEC.outborn = false
        gutCheckNEC.necRate = 7
        gutCheckNEC.humanMilkFeeding = false
        gutCheckNEC.probiotics = false
        gutCheckNEC.infections = 0
        gutCheckNEC.prbcTransfusion = false
        gutCheckNEC.hypotension = false
        gutCheckNEC.metabolicAcidosis = false
        let expectedPoints = 18
        let actualPoints = gutCheckNEC.points
        XCTAssertEqual(expectedPoints, actualPoints)
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
