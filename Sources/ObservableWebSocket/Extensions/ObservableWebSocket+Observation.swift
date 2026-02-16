//
//  ObservableWebSocket+Observation.swift
//
//
//  Created by Fernando Fernandes on 17.04.24.
//

import Foundation

extension ObservableWebSocket {

    func observeWebSocketConnection() {

        // MARK: Messages

        service.$message.sink { [weak self] message in
            if let message {
                self?.isConnected = true
                self?.codableMessage = CodableWebSocketMessage(message: message)
            }
        }
        .store(in: &cancellables)

        // MARK: Errors

        service.$codableError.sink { [weak self] codableError in
            if let codableError {
                self?.pingTimer?.invalidate()
                self?.isConnected = false
                self?.codableError = codableError
            }
        }
        .store(in: &cancellables)
    }
}
