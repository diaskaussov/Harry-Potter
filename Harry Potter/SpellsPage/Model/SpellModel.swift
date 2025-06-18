
import SwiftUI

struct Spell: Identifiable, Decodable {
    var id: String
    var name: String?
    var description: String?
}

let spells = [
    Spell(id: "0", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "1", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "2", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "3", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "4", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "5", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "6", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "7", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "8", name: "Fireball", description: "A fiery blast of energy."),
    Spell(id: "9", name: "Fireball", description: "A fiery blast of energy."),
]
