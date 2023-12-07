import Algorithms

struct Day02: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    var games: [String] {
        data.split(separator: "\n").map { String($0) }
    }
    
    func part1() -> Any {
        var result = 0
        
        for game in games {
            result += isGamePossible(game: game)
        }
        
        return result
    }
    
    func part2() -> Any {
        var result = 0
        
        for game in games {
            result += powerOfGame(game: game)
        }
        
        return result
    }
    
    private func isGamePossible(game: String) -> Int {
        let gameNameAndSets = game.split(separator: ":")
        let gameID = Int(String(gameNameAndSets[0].filter { $0.isNumber } )) ?? 0
        let gameSets = gameNameAndSets.last?.split(separator: ";") ?? []
        var isPossible = false
        
        for gameSet in gameSets {
            let set = String(gameSet)
            isPossible = isSetPossible(set)
            if !isPossible {
                break
            }
        }
        
        return isPossible ? gameID : 0
    }
    
    //12 red cubes, 13 green cubes, and 14 blue cubes
    private func isSetPossible(_ set: String) -> Bool {
        var result = false
        let cubes = set.replacingOccurrences(of: " ", with: "").split(separator: ",")
        
        for cube in cubes {
            let countStr = cube.filter { $0.isNumber }
            let count = Int(countStr) ?? 0
            
            if cube.contains("red") {
                result = count <= 12 ? true : false
            } else if cube.contains("green") {
                result = count <= 13 ? true : false
            } else {
                result = count <= 14 ? true : false
            }
            
            if !result {
                break
            }
        }
        
        return result
    }
    
    private func powerOfGame(game: String) -> Int {
        var result = 0
        let gameNameAndSets = game.split(separator: ":")
        let gameSets = gameNameAndSets.last?.split(separator: ";") ?? []
        
        var minRedNeeded = 1
        var minGreenNeeded = 1
        var minBlueNeeded = 1
        
        for gameSet in gameSets {
            let set = String(gameSet)
            let cubes = set.replacingOccurrences(of: " ", with: "").split(separator: ",")
            
            for cube in cubes {
                let countStr = cube.filter { $0.isNumber }
                let count = Int(countStr) ?? 0
                
                if cube.contains("red") {
                    minRedNeeded = count > minRedNeeded ? count : minRedNeeded
                } else if cube.contains("green") {
                    minGreenNeeded = count > minGreenNeeded ? count : minGreenNeeded
                } else {
                    minBlueNeeded = count > minBlueNeeded ? count : minBlueNeeded
                }
            }
        }
        
        result = minRedNeeded * minGreenNeeded * minBlueNeeded
        
        return result
    }
}
