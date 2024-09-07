//
//  SallaPOCTests.swift
//  SallaPOCTests
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import XCTest
import Combine
@testable import SallaPOC

class NetworkManagerTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable> = []

    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager.shared
        cancellables = []
    }
    
    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }
    
    // Test case 1: Initialization Test
    func testInitialization() {
        XCTAssertNotNil(networkManager.sessionManager)
        XCTAssertNotNil(networkManager.reachabilityManager)
        XCTAssertEqual(URLCache.shared.memoryCapacity, 20 * 1024 * 1024) // 20 MB
        XCTAssertEqual(URLCache.shared.diskCapacity, 100 * 1024 * 1024) // 100 MB
    }

}
