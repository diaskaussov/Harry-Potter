
import UIKit

final class SingleCharacterPresenter {
    
    private let character: IndividualCharacterInfo
    private let house: HouseModel
    private let characterInfoType: [CharacterInfoType: String]

    
    init(character: IndividualCharacterInfo, house: HouseModel) {
        self.character = character
        self.house = house
        self.characterInfoType = CharacterInfoFormatter.createCharacterInfoMap(from: character)
    }
    
    var characterImage: UIImage {
        return character.image ?? UIImage(named: house.name.lowercased()) ?? UIImage()
    }
    
    func getInfo(for type: CharacterInfoType) -> String {
        return characterInfoType[type] ?? "unknown"
    }
    
    func getAllInfoTypes() -> [CharacterInfoType] {
        return CharacterInfoType.allCases
    }
}
