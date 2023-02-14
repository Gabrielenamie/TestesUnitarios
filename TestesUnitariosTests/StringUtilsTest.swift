//
//  StringUtilsTest.swift
//  TestesUnitariosTests
//
//  Created by Gabriele Namie on 14/02/23.
//

import Quick
import Nimble
@testable import TestesUnitarios

class StringUtilsTest: QuickSpec {
    override func spec() {
        describe("StringUtils") {
            context("Is Valid Email") {
                it("Valid Email") {
                    let email = "teste@gmail.com"
                    let isValidEmail = email.isValidEmail()
                    expect(isValidEmail).to(beTrue())
                }
                it("Invalid Email") {
                    let email = "teste"
                    let isValidEmail = email.isValidEmail()
                    expect(isValidEmail).to(beFalse())
                }
                it("Invalid Email") {
                    let email = "teste"
                    let isValidEmail = email.isValidEmail()
                    expect(isValidEmail) == false
                }
            }
            context("Remove White Space") {
                it("With White Space") {
                    let text = "Olá mundo"
                    let newText = text.removeWhitespace()
                    expect(newText).to(equal("Olámundo"))
                }
                it("Without White Space") {
                    let text = "Olámundo"
                    let newText = text.removeWhitespace()
                    expect(newText).to(equal(text))
                }
            }
        }
    }
}
