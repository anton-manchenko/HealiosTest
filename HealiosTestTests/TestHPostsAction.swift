//
//  TestHPostsAction.swift
//  HealiosTestUITests
//
//  Created by Anton on 13.04.2021.
//

import XCTest
@testable
import HealiosTest

class TestHPostsAction: XCTestCase {

    private var main:AppMain = .init()
    
    override func setUp() {
        super.setUp()
        main = .init()
    }
    
    func testHPostsActionNilData() throws {
        main.store.dispatch(HPostsAction.requestPosts(NilServiceData()))
        XCTAssertNil(main.store.state.hPostsState.posts, "Wrong data in store")
    }

    func testErrorData() throws {
        main.store.dispatch(HPostsAction.requestPosts(ErrorServiceData()))
        XCTAssertNotNil(main.store.state.hPostsState.error, "Error data missed in store")
    }
    func testExisitsData() throws {
        main.store.dispatch(HPostsAction.requestPosts(NotNilServiceData()))
        XCTAssertNotNil(main.store.state.hPostsState.posts, "Wrong data in store")
    }
}



