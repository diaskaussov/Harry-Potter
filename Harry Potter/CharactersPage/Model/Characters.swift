
import UIKit

struct IndividualCharacterInfo {
    let name: String?
    let species: String?
    let gender: String?
    let house: String?
    let wizard: Bool?
    let ancestry: String?
    let wand: Wand?
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let image: UIImage?
}

struct rawDataOfCharacters: Codable {
    let name: String?
    let species: String?
    let gender: String?
    let house: String?
    let wizard: Bool?
    let ancestry: String?
    let wand: Wand?
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let image: String?
}

struct Wand: Codable {
    let wood: String?
    let core: String?
    let length: Double?
}
