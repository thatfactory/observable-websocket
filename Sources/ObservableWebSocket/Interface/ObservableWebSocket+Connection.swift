//
//  ObservableWebSocket+Connection.swift
//
//
//  Created by Fernando Fernandes on 18.04.24.
//

import Foundation

extension ObservableWebSocket {
    /// Sends a close frame with an optional close reason.
    ///
    /// This function also invalidates the `pingTimerInterval`, if any.
    ///
    /// - Parameters:
    ///   - closeCode: A `URLSessionWebSocketTask.CloseCode` that indicates the reason for closing the connection. The default is `.normalClosure`.
    ///   - reason: Optional further information to explain the closing. The value of this parameter is defined by the endpoints, not by the standard.
    public func closeConnection(
        with closeCode: URLSessionWebSocketTask.CloseCode = .normalClosure,
        reason: String? = nil
    ) {
        pingTimer?.invalidate()
        service.close(reason: reason)
        isConnected = false
    }
}
