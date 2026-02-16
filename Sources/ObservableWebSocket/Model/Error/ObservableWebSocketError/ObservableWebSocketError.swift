//
//  ObservableWebSocketError.swift
//
//
//  Created by Fernando Fernandes on 03.01.24.
//

import Foundation
import Toolbox

public enum ObservableWebSocketError: Error, Equatable, Codable {
    case decodingMessage(CodableError)
    case encodingMessage(CodableError)
}
