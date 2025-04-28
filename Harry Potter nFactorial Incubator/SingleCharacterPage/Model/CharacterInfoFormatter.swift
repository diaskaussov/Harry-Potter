
import UIKit

struct CharacterInfoFormatter {
    
    static func makeCharacterInfoMap(
        from character: IndividualCharacterInfo
    ) -> [CharacterInfoType: String] {
        
        return [
            .name: formatValue(character.name),
            .species: formatValue(character.species),
            .gender: formatValue(character.gender),
            .house: formatValue(character.house),
            .wizard: getFormattedWizard(character),
            .ancestry: formatValue(character.ancestry),
            .wand: getFormattedWandInfo(character),
            .patronus: formatValue(character.patronus),
            .status: getFormattedStatus(character),
            .actor: formatValue(character.actor)
        ]
    }
    
    private static func formatValue(_ value: String?) -> String {
        guard let value = value, !value.isEmpty else {
            return "unknown"
        }
        return value
    }
    
    private static func getFormattedWizard(_ character: IndividualCharacterInfo) -> String {
        guard let wizard = character.wizard else { return "unknown" }
        return wizard ? "yes" : "no"
    }
    
    private static func getFormattedWandInfo(_ character: IndividualCharacterInfo) -> String {
        guard let wand = character.wand else { return "unknown" }
        
        if wand.wood == "" && wand.core == "" && wand.length == nil {
            return "unknown"
        }
        
        let wood = wand.wood == "" ? "unknown" : wand.wood ?? "unknown"
        let core = wand.core == "" ? "unknown" : wand.core ?? "unknown"
        let length = wand.length.map { "\($0)" } ?? "unknown"
        
        return "\(wood) wood, \(core) core, \(length) inch"
    }
    
    private static func getFormattedStatus(_ character: IndividualCharacterInfo) -> String {
        if character.hogwartsStudent == true {
            return "student"
        }
        if character.hogwartsStaff == true {
            return "staff"
        }
        return "not student/staff"
    }
}

