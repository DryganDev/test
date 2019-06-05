//
//  Pair.swift
//  test
//
//  Created by Drygan on 6/5/19.
//  Copyright © 2019 drygan.dev. All rights reserved.
//

import Foundation

struct Pair {
    
    var firstCurrency: String
    var secondCurrency: String
    var rate: Double

    public init(firstCurrency: String, secondCurrency: String, rate: Double) {
        self.firstCurrency = firstCurrency
        self.secondCurrency = secondCurrency
        self.rate = rate
    }
    
    private enum Codingkeys: String, CodingKey {
        case firstCurrency = "base"
        case secondCurrency
        case rates
    }
    
}

extension Pair: Codable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Pair.Codingkeys.self)
        firstCurrency = try values.decode(String.self, forKey: .firstCurrency)
        let container = try values.decode([String: Double].self, forKey: .rates)
        guard let tuple = container.first else { throw DecodingError.valueNotFound(String.self, DecodingError.Context(codingPath: [], debugDescription: "Ненайдено")) }
        secondCurrency = tuple.0
        rate = tuple.1
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: Pair.Codingkeys.self)
        try values.encode(firstCurrency, forKey: .firstCurrency)
        try values.encode([secondCurrency:rate], forKey: .rates)
    }
    
}

