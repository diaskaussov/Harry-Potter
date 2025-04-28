
import UIKit

final class SingleCharacterPresenter {
    
    private let singleCharacter: IndividualCharacterInfo
    
    private let firstLetter: String
    
    private let characterInfoMap: [CharacterInfoType: String]

    
    init(character: IndividualCharacterInfo, firstLetter: String) {
        self.singleCharacter = character
        
        self.firstLetter = firstLetter
        
        self.characterInfoMap = CharacterInfoFormatter.makeCharacterInfoMap(from: character)
    }
    
    func getImage() -> UIImage {
        return singleCharacter.image ?? UIImage(named: firstLetter) ?? UIImage()
    }
    
    func getInfo(for type: CharacterInfoType) -> String {
        return characterInfoMap[type] ?? "unknown"
    }
    
    func getAllInfoTypes() -> [CharacterInfoType] {
        return [
            .name, .species, .gender, .house,
            .wizard, .ancestry, .wand, .patronus,
            .status, .actor
        ]
    }
}
