//
//  AccountViewModelSpace.swift
//  TestesUnitariosTests
//
//  Created by Gabriele Namie on 14/02/23.
//

import Quick
import Nimble
@testable import TestesUnitarios

class AccountViewModelSpace: QuickSpec {
    
    override func spec() {
        //colocar a view a ser testada na describe
        describe("AccountViewModel") {
            var sut: AccountViewModel!
            var showAlert:Bool!
            var askUserPermission:Bool!
            var completion: Bool!
            beforeEach {
                showAlert = false
                askUserPermission = false
                completion = false
            }
            //colocar o que vai ser testado no context
            context("Should Request Location") {
                
                it("Use Location True") {
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel(instruction: ""))
                    
                    sut.shouldRequestLocation(
                        showAlert: {
                            showAlert = true
                        },
                        askUserPermission: {
                            askUserPermission = true
                        },
                        completion: {
                            completion = true
                        })
                    
                    expect(showAlert).to(equal(false))
                    expect(askUserPermission).to(equal(true))
                    expect(completion).to(equal(true))
                }
                it("Use Location False") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))
                    
                    sut.shouldRequestLocation(
                        showAlert: {
                            showAlert = true
                        },
                        askUserPermission: {
                            askUserPermission = true
                        },
                        completion: {
                            completion = true
                        })
                    
                    expect(showAlert).to(equal(true))
                    expect(askUserPermission).to(equal(false))
                    expect(completion).to(equal(true))
                }
                
                it("loginButtonTap") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))
                    expect(sut.loginButtonTap()).to(beVoid())
                }
            }
            context("AccountViewModelProtocol") {
                it("Verify AccountViewModelProtocol"){
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))
                    expect(sut).to(beAKindOf(AccountViewModelProtocol.self))
                }
            }
            
            context("Instruction Text") {
                it("Verify using location"){
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel(instruction: "Olá mundo"))
                    expect(sut.instructionText).to(equal("Olá mundo com localização"))
                }
                
                it("Verify not using location"){
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: "Olá mundo"))
                    expect(sut.instructionText).to(equal("Olá mundo"))
                }
            }
            
            context("Get Joke") {
                it("With error"){
                    sut = AccountViewModel(shouldUseLocation: true,
                                           model: AccountModel(instruction: "Olá mundo"),
                                           provider: ProviderMock(status: .invalidResponse))
                    sut.getJoke()
                    expect(sut.status).to(equal("Erro"))
                }
                
                it("Without error"){
                    sut = AccountViewModel(shouldUseLocation: true,
                                           model: AccountModel(instruction: "Olá mundo"),
                                           provider: ProviderMock(status: .success))
                    sut.getJoke()
                    expect(sut.status).to(equal("animal"))
                }
                
                //                it("Verify not using location"){
                //                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: "Olá mundo"))
                //                    expect(sut.instructionText).to(equal("Olá mundo"))
                //                }
            }
        }
    }
}
