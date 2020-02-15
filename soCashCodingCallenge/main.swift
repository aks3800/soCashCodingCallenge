//
//  main.swift
//  soCashCodingCallenge
//
//  Created by Akshat Sharma on 15/02/20.
//  Copyright © 2020 aks. All rights reserved.
//

import Foundation

var distributedCards: [Card] = []

func isCardDistributed(card: Card) -> Bool {
    var flag = true
    for distributedCard in distributedCards {
        if distributedCard.suite == card.suite && distributedCard.value == card.value {
            flag = false
            break
        }
    }
    return flag
}

func getCard() -> Card {
    if let cardValue = CardValue.allCases.randomElement(), let cardSuite = CardSuite.allCases.randomElement() {
        let card = Card(suite: cardSuite, value: cardValue)
        if !isCardDistributed(card: card) {
            distributedCards.append(card)
            return card
        } else {
            return getCard()
        }
    } else {
        return getCard()
    }
}

class Player {
    let name: String
    var cards: [Card] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addCard(card: Card) -> Void {
        cards.append(card)
    }
}

let playerA = Player(name: "A")
let playerB = Player(name: "B")
let playerC = Player(name: "C")
let playerD = Player(name: "D")

let players = [playerA, playerB, playerC, playerD]


func distributeCardsAmongPlayers() -> Void {
    while distributedCards.count == players.count * 3 {
        for player in players {
            player.addCard(card: getCard())
        }
    }
}


print(getCard())
