//
//  TestHPostsDetailAction.swift
//  HealiosTestTests
//
//  Created by Anton on 13.04.2021.
//

import XCTest
@testable
import HealiosTest

class TestHPostsDetailAction: XCTestCase {

    private var main:AppMain = .init()
    
    override func setUp() {
        super.setUp()
        main = .init()
    }
    
    func testHPostsDetailActionCommentsNilData() throws {
        main.store.dispatch(HPostsDetailAction.requestComments(NilServiceData()))
        XCTAssertNil(main.store.state.hPostDetailState.comments, "Wrong data in store")
    }

    func testHPostsDetailActionCommentsErrorData() throws {
        main.store.dispatch(HPostsDetailAction.requestComments(ErrorServiceData()))
        XCTAssertNotNil(main.store.state.hPostDetailState.error, "Error data missed in store")
    }
    func testHPostsDetailActionCommentsExisitsData() throws {
        main.store.dispatch(HPostsDetailAction.requestComments(NotNilServiceData()))
        XCTAssertNotNil(main.store.state.hPostDetailState.comments, "Wrong data in store")
    }
    func testHPostsDetailActionUsersNilData() throws {
        main.store.dispatch(HPostsDetailAction.requestUsers(NilServiceData()))
        XCTAssertNil(main.store.state.hPostDetailState.users, "Wrong data in store")
    }

    func testHPostsDetailActionUsersErrorData() throws {
        main.store.dispatch(HPostsDetailAction.requestUsers(ErrorServiceData()))
        XCTAssertNotNil(main.store.state.hPostDetailState.error, "Error data missed in store")
    }
    func testHPostsDetailActionUsersExisitsData() throws {
        main.store.dispatch(HPostsDetailAction.requestUsers(NotNilServiceData()))
        XCTAssertNotNil(main.store.state.hPostDetailState.users, "Wrong data in store")
    }
    
}
