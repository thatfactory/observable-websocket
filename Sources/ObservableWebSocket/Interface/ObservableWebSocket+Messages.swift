//
//  ObservableWebSocket+Messages.swift
//
//
//  Created by Fernando Fernandes on 17.04.24.
//

import Foundation

extension ObservableWebSocket {
    /// Sends the WebSocket server the given message, as is.
    ///
    /// Message replies/errors can be observed via:
    /// ```
    /// ObservableWebSocket.getter:codableMessage
    /// ObservableWebSocket.getter:error
    /// ```
    ///
    /// - Parameter message: The message to be sent to the server.
    ///
    /// - Usage Example:
    /// ```
    /// wsClient.sendMessage(
    ///     "{\"id\": \"\(myId)\", \"type\": \"ping\"}"
    /// )
    /// ```
    ///
    /// This will send the server a message like:
    /// ```
    /// {"id": "myId", "type": "ping"}
    /// ```
    public func sendMessage(_ message: String) {
        service.send(message: message)
    }

    /// Sends the WebSocket server a message including a dynamically generated ID.
    ///
    /// Message replies/errors can be observed via:
    /// ```
    /// ObservableWebSocket.getter:codableMessage
    /// ObservableWebSocket.getter:error
    /// ```
    ///
    /// - Parameter idInjector: A closure that takes a `String` (the generated message ID) and returns
    ///   a modified message string incorporating the generated message ID.
    ///
    /// - Usage Example:
    /// ```
    /// wsClient.sendMessageWithGeneratedId { generatedId in
    ///     "{\"id\": \"\(generatedId)\", \"type\": \"ping\"}"
    /// }
    /// ```
    ///
    /// This will send the server a message like:
    /// ```
    /// {"id": "123e4567-e89b-12d3-a456-426614174000", "type": "ping"}
    /// ```
    public func sendMessageWithGeneratedId(_ idInjector: (@Sendable (String) -> String)) {
        let uniqueId = UUID().uuidString
        let messageWithId = idInjector(uniqueId)
        service.send(message: messageWithId)
    }
}
