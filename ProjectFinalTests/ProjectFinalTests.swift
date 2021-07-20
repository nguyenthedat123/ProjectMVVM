//
//  ProjectFinalTests.swift
//  ProjectFinalTests
//
//  Created by The Dat on 7/16/21.
//

import XCTest
@testable import ProjectFinal

class ProjectFinalTests: XCTestCase {
    
    let catViewModel = CatViewModel()
    
    override func setUpWithError() throws {
//        var data1:Int = 10
//        var data2:Int = 20
//        var data3:Int = 5
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testnumberOfRowsInSection() throws {
        
        /*
         case 1: section = 10 -> kq: 10
         */
        let test1 = catViewModel.numberOfRowsInSection(section: 0)
        XCTAssert(test1 == 0)

//        /*
//         case 2: section = 20 -> kq: 20
//         */
//        let test2 = catViewModel.numberOfRowsInSection(section: 20)
//        XCTAssert(test1 == 0)
//
//        /*
//         case 3: section = 5 -> kq: 5
//         */
//        let test3 = catViewModel.numberOfRowsInSection(section: 5)
//        XCTAssert(test1 == 130)
        
    }
    
    func testCallApis() throws {
//        var service = CatService(isTest: true)
        let test1 = catViewModel.requestRepositories()
        XCTAssert(test1 != nil)
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
