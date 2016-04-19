//
//  AttentionAPITests.swift
//  Attension
//
//  Created by Hiraku Ohno on 2016/04/19.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import XCTest
@testable import Attension

class AttentionAPITests: XCTestCase {

    func testGetAPI() {
        let expectation = self.expectationWithDescription("Wait for API response")
        AttentionAPIClient.sharedInstance.getAttentionItems(0, longitude: 0, radius: 0).on(success: { (items) in
            XCTAssert(0 < items.count)
            expectation.fulfill()

        }) { (error, isCancelled) in
            XCTFail()
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(5, handler: nil)
    }
    
}
