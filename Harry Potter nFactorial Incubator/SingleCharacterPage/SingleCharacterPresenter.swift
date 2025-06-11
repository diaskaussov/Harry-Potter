
import UIKit

final class SingleCharacterPresenter {
    
    private let singleCharacter: IndividualCharacterInfo
    private let house: HouseModel
    private let characterInfoType: [CharacterInfoType: String]

    
    init(character: IndividualCharacterInfo, house: HouseModel) {
        self.singleCharacter = character
        self.house = house
        self.characterInfoType = CharacterInfoFormatter.makeCharacterInfoMap(from: character)
    }
    
    var characterImage: UIImage {
        return singleCharacter.image ?? UIImage(named: house.name.lowercased()) ?? UIImage()
    }
    
    func getInfo(for type: CharacterInfoType) -> String {
        return characterInfoType[type] ?? "unknown"
    }
    
    func getAllInfoTypes() -> [CharacterInfoType] {
        return [
            .name, .species, .gender, .house,
            .wizard, .ancestry, .wand, .patronus,
            .status, .actor
        ]
    }
}
