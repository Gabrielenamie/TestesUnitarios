//
//  AccountBalanceSpec.swift
//  TestesUnitariosTests
//
//  Created by Gabriele Namie on 13/02/23.
//

import XCTest
@testable import TestesUnitarios

final class AccountBalanceSpec: XCTestCase {
    var account: AccountBalance?
    
    func testGetSpecialBalance100() {
        account = AccountBalance(balance: 99)
        let specialBalance = account?.getSpecialLimit()
        
        XCTAssertEqual(specialBalance, 109, "O saldo menor que 100, deve retornar o saldo + 10")
    }
    
    func testGetSpecialBalance900() {
        account = AccountBalance(balance: 900)
        let specialBalance = account?.getSpecialLimit()
        
        XCTAssertEqual(specialBalance, 1900, "O saldo maior que 500, deve retornar o saldo + 1000")
        XCTAssertGreaterThan(specialBalance ?? 0, (account?.balance ?? 0))
    }
    
    func testGetSpecialBalance400() {
        account = AccountBalance(balance: 400)
        let specialBalance = account?.getSpecialLimit()
        
        XCTAssertEqual(specialBalance, 400, "O saldo maior que 100, deve retornar o saldo")
    }
}
