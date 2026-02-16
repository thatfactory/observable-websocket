//
//  CodableWebSocketMessage.swift
//
//
//  Created by Fernando Fernandes on 28.02.24.
//

import Foundation

/// Defines a `Codable` wrapper for `URLSessionWebSocketTask.Message`.
public struct CodableWebSocketMessage: Equatable, Codable, Identifiable {
    public let id = UUID()
    public let message: URLSessionWebSocketTask.Message

    public init(message: URLSessionWebSocketTask.Message) {
        self.message = message
    }
}

// MARK: - Interface

public extension CodableWebSocketMessage {
    func messageAsString() -> String {
        switch message {
        case .string(let text):
            return text
        case .data(let data):
            return String(decoding: data, as: UTF8.self)
        @unknown default:
            return "Unknown message format"
        }
    }
}
