//
//  StringUtilsSpec.swift
//  TestesUnitariosTests
//
//  Created by Gabriele Namie on 14/02/23.
//

import XCTest
@testable import TestesUnitarios

class StringUtilsSpec: XCTestCase {

    func testIsValidEmail() {
        let email = "teste"
        let value = email.isValidEmail()
        
        XCTAssertFalse(value, "Não é um email válido")
    }
    
    func testRemoveWhiteSpace() {
        let text = "Olá Mundo"
        let newText = text.removeWhitespace()
        
        XCTAssert(newText == "OláMundo", "Não removeu os espaços")
    }
    
    func testReplace() {
        let text = "Swift"
        let newText = text.replace(string: "S", replacement: "D")
        let newText2 = newText.replace(string: "t", replacement: "x")
        
        XCTAssert(newText == "Dwift")
        XCTAssert(newText2 == "Dwifx")
    }

}
