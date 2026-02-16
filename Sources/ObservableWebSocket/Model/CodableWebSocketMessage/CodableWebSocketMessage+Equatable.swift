//
//  CodableWebSocketMessage+Equatable.swift
//
//
//  Created by Fernando Fernandes on 28.02.24.
//

import Foundation

extension CodableWebSocketMessage {
    public static func == (lhs: CodableWebSocketMessage, rhs: CodableWebSocketMessage) -> Bool {
        switch (lhs.message, rhs.message) {
        case (.string(let lhsString), .string(let rhsString)):
            return lhsString == rhsString
        case (.data(let lhsData), .data(let rhsData)):
            return lhsData == rhsData
        default:
            return false
        }
    }
}
