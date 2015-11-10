//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
    // initialize all the ships
        let smallShip = Ship(length: 2, location: GridLocation(x: 6, y: 0), isVertical: false)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 5, y: 0), isVertical: true)
        let largeShip = Ship(length: 4, location: GridLocation(x: 1, y: 4), isVertical: false)
        let xtraLargeShip = Ship(length: 5, location: GridLocation(x: 6, y: 3), isVertical: true)
    
    // initialize the 2 mines and what happens when they are hit
        let mine1 = Mine(location: GridLocation(x: 1, y: 6), explosionText: "Kaboom bitch! That was mine 1")
        let mine2 = Mine(location: GridLocation(x: 1, y: 2), explosionText: "Kaboom bitch! That was mine 2")
        
    // now put the game objects on the grid
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(xtraLargeShip)
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
        
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = 0                
    
    // this is ugly, but it's what the assignment called for
        
        finalScore = ((5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus) + ((5 - gameStats.humanShipsSunk) * gameStats.sinkBonus) - ((gameStats.numberOfMissesByHuman + gameStats.numberOfHitsOnEnemy) * gameStats.guessPenalty)
        
        
        print("the value of final score is \(finalScore)")
        
        return finalScore
    }
}