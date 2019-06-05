//
//  TTError.swift
//  test
//
//  Created by Drygan on 6/5/19.
//  Copyright © 2019 drygan.dev. All rights reserved.
//

import Foundation

enum TTError: Error {
    case invalidUrl
}

extension TTError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .invalidUrl: return "Внутренняя ошибка"
        default: return ""
        }
    }
}
