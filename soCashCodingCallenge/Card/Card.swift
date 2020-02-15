//
//  Card.swift
//  soCashCodingCallenge
//
//  Created by Akshat Sharma on 15/02/20.
//  Copyright © 2020 aks. All rights reserved.
//

import Cocoa

enum CardSuite: CaseIterable {
    case clubs
    case diamonds
    case hearts
    case spades
}

enum CardValue: Int, CaseIterable {
    case king = 13
    case queen = 12
    case jack = 11
    case ten = 10
    case nine = 9
    case eight = 8
    case seven = 7
    case six = 6
    case five = 5
    case four = 4
    case three = 3
    case two = 2
    case ace = 1
}

struct Card {
    let suite: CardSuite
    let value: CardValue
}
