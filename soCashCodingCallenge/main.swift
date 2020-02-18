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
    var flag = false
    for distributedCard in distributedCards {
        if distributedCard.suite == card.suite && distributedCard.value == card.value {
            flag = true
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
    
    func printCards() -> Void {
        for card in cards {
            print("\(card.suite) \(card.value.rawValue)")
        }
    }
}

func isCardsOfSameSuite(cards: [Card]) -> Bool {
    if cards.count < 2 {
        return true
    } else {
        var flag = true
        let suite: CardSuite = cards[0].suite
        for card in cards {
            if card.suite != suite {
                flag = false
                break
            }
        }
        return flag
    }
}

func isCardsOfSameValue(cards: [Card]) -> Bool {
    if cards.count < 2 {
        return true
    } else {
        var flag = true
        let value: CardValue = cards[0].value
        for card in cards {
            if card.value != value {
                flag = false
                break
            }
        }
        return flag
    }
}

func rankOfSameValueCards(cards: [Card]) {
    
}

func isCardsInSequence(cards: [Card]) -> Bool {
    if cards.count < 2 {
        return true
    } else if cards.count == 2 {
        let diff = abs(cards[0].value.rawValue - cards[1].value.rawValue)
        if diff == 12 || diff == 1 {
            return true
        } else {
            return false
        }
    } else {
        var sortedCards = cards
        sortedCards.sort { (card1, card2) -> Bool in
            return card1.value.rawValue > card2.value.rawValue
        }
        let diff1 = abs(sortedCards[0].value.rawValue - sortedCards[1].value.rawValue)
        let diff2 = abs(sortedCards[0].value.rawValue - sortedCards[2].value.rawValue)
        if diff1 == 1 && (diff2 == 2 || diff2 == 12) {
            return true
        } else {
            return false
        }
    }
}

func isPairPresentInCards(cards: [Card]) -> CardValue? {
    if cards.count < 2 {
        return nil
    } else if cards.count == 2 {
        if cards[0].value.rawValue == cards[1].value.rawValue {
            return cards[0].value
        } else {
            return nil
        }
    } else {
        var sortedCards = cards
        sortedCards.sort { (card1, card2) -> Bool in
            return card1.value.rawValue > card2.value.rawValue
        }
        let diff1 = abs(sortedCards[0].value.rawValue - sortedCards[1].value.rawValue)
        let diff2 = abs(sortedCards[0].value.rawValue - sortedCards[2].value.rawValue)
        if diff1 == 0 {
            return sortedCards[1].value
        } else if diff2 == 0 {
            return sortedCards[2].value
        } else {
            if sortedCards[1].value.rawValue == sortedCards[2].value.rawValue {
                return sortedCards[1].value
            }
            return nil
        }
    }
}

//if let value = isPairPresentInCards(cards: [Card(suite: CardSuite.clubs, value: CardValue.king), Card(suite: CardSuite.clubs, value: CardValue.ace), Card(suite: CardSuite.clubs, value: CardValue.king)]) {
//    print(value)
//}

func topValueInCards(cards: [Card]) -> CardValue {
    var sortedCards = cards
    sortedCards.sort { (card1, card2) -> Bool in
        return card1.value.rawValue > card2.value.rawValue
    }
    if sortedCards[cards.count - 1].value.rawValue == CardValue.ace.rawValue {
        return CardValue.ace
    } else {
        return sortedCards[0].value
    }
}


let playerA = Player(name: "A")
let playerB = Player(name: "B")
let playerC = Player(name: "C")
let playerD = Player(name: "D")

let players = [playerA, playerB, playerC, playerD]


func distributeCardsAmongPlayers() -> Void {
    while distributedCards.count != players.count * 3 {
        for player in players {
            player.addCard(card: getCard())
        }
    }
}

func simulateGame() -> Void {
    
    distributeCardsAmongPlayers()
    
    
}
