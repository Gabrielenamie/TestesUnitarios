//
//  TestesUnitariosTests.swift
//  TestesUnitariosTests
//
//  Created by Gabriele Namie on 13/02/23.
//

import XCTest
@testable import TestesUnitarios

final class TestesUnitariosTests: XCTestCase {

    override func setUpWithError() throws {
        // Função ocorre antes do teste, serve para configurar algo antes do teste
        print("1")
    }

    override func tearDownWithError() throws {
        // Função ocorre depois do teste, serve para "limpar" algo depois do teste
        print("3")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("2")
    }

    func testPerformanceExample() throws {

    }

}
