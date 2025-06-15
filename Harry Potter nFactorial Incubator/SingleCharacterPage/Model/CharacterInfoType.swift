
import UIKit

enum CharacterInfoType: CaseIterable {
    case name, species, gender,
         house, wizard, ancestry,
         wand, patronus, status, actor
    
    var label: String {
        switch self {
            case .name: return "Name: "
            case .species: return "Species: "
            case .gender: return "Gender: "
            case .house: return "House: "
            case .wizard: return "Wizard: "
            case .ancestry: return "Ancestry: "
            case .wand: return "Wand info:\n"
            case .patronus: return "Patronus: "
            case .status: return "Position: "
            case .actor: return "Actor: "
        }
    }
}
