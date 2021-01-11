//
//  GutCheckNECTests.swift
//  NEC-ZeroTests
//
//  Created by David Celaya-Gonzalez on 1/11/21.
//

import XCTest
@testable import NEC_Zero

class GutCheckNECTests: XCTestCase {

	func testGutCheckNecDefaults() {
		let gutCheckNEC = GutCheckNEC()
		let expectedPoints = 22
		let actualPoints = gutCheckNEC.points
		XCTAssertEqual(expectedPoints, actualPoints)
	}

//	func testGutCheckNECMinimums() {
//		let gutCheckNEC =
//	}

}
