//
//  ObservableWebSocketError+Localization.swift
//
//
//  Created by Fernando Fernandes on 28.02.24.
//

import Foundation

extension ObservableWebSocketError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingMessage(let error):
            """
            There was an error while decoding a WebSocket message:
            \(error.localizedDescription)
            """
        case .encodingMessage(let error):
            """
            There was an error while encoding a WebSocket message:
            \(error.localizedDescription)
            """
        }
    }
}
