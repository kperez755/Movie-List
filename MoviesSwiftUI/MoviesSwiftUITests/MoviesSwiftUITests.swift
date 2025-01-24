//
//  MoviesSwiftUITests.swift
//  MoviesSwiftUITests
//
//  Created by Kevin Perez on 1/14/25.
//

import XCTest
import Combine

final class MoviesSwiftUITests: XCTestCase {

    private var cancellable: Set<AnyCancellable> = []
    
    func testFetchMovies() throws {
        
        let httpClient = HTTPClient()
        
        let expectation = XCTestExpectation(description: "Received movies")
        httpClient.fetchMovies(search: "Batman")
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail("Request failed with error \(error)")
                }
            } receiveValue: { movies in
                XCTAssertTrue(movies.count > 0)
            }.store(in: &cancellable)
       
    }

}
