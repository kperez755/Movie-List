//
//  String+Extensions.swift
//  MoviesSwiftUI
//
//  Created by Kevin Perez on 1/12/25.
//

import Foundation

extension String {
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
