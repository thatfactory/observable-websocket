//
//  ObservableWebSocket+Connection.swift
//  
//
//  Created by Fernando Fernandes on 18.04.24.
//

import Foundation

public extension ObservableWebSocket {

    /// Sends a close frame with an optional close reason.
    ///
    /// This function also invalidates the `pingTimerInterval`, if any.
    ///
    /// - Parameter closeCode: A `URLSessionWebSocketTask.CloseCode`
    /// that indicates the reason for closing the connection. The default is `.normalClosure`.
    /// - Parameter reason: Optional further information to explain the closing.
    /// The value of this parameter is defined by the endpoints, not by the standard.
    func closeConnection(with closeCode: URLSessionWebSocketTask.CloseCode = .normalClosure,
                         reason: String? = nil) {
        pingTimer?.invalidate()
        service.close(reason: reason)
        isConnected = false
    }
}
