
import UIKit

class CharactersNetworkingService {
    
    func fetchCharactersForHouse(
        _ house: String,
        completion: @escaping ([rawDataOfCharacters]?) -> Void
    ) {
        
        let urlString = "https://hp-api.onrender.com/api/characters/house/\(house)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }
            
            let characters = self.parseJson(data: data)
            
            completion(characters)
            
        }.resume()
    }
    
    private func parseJson(data: Data) -> [rawDataOfCharacters]? {
        do {
            let decodedData = try JSONDecoder().decode([rawDataOfCharacters].self, from: data)
            return decodedData
        } catch {
            return nil
        }
    }
    
    func downloadCharacterImages(
        characters: [rawDataOfCharacters],
        completion: @escaping ([IndividualCharacterInfo]) -> Void
    ) {
        
        var charactersInfo: [IndividualCharacterInfo] = []
        
        let charactersInfoLock = NSLock()
        
        let dispatchGroup = DispatchGroup()
        
        for character in characters {
            
            dispatchGroup.enter()
            
            let addCharacterInfo = { (image: UIImage?) in
                let info = IndividualCharacterInfo(
                    name: character.name,
                    species: character.species,
                    gender: character.gender,
                    house: character.house,
                    wizard: character.wizard,
                    ancestry: character.ancestry,
                    wand: character.wand,
                    patronus: character.patronus,
                    hogwartsStudent: character.hogwartsStudent,
                    hogwartsStaff: character.hogwartsStaff,
                    actor: character.actor,
                    image: image
                )
                
                charactersInfoLock.lock()
                charactersInfo.append(info)
                charactersInfoLock.unlock()
                
                dispatchGroup.leave()
            }
            
            if let imageUrlString = character.image,
               let url = URL(string: imageUrlString) {
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    
                    var image: UIImage?
                    
                    if let data = data, error == nil {
                        image = UIImage(data: data)
                    }
                    
                    addCharacterInfo(image)
                }.resume()
                
            } else {
                addCharacterInfo(nil)
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            let sortedInfo = charactersInfo.sorted(by: { (first, second) -> Bool in
                if first.image != nil && second.image == nil {
                    return true
                } else if first.image == nil && second.image != nil {
                    return false
                } else {
                    return (first.name ?? "") < (second.name ?? "")
                }
            } )
            completion(sortedInfo)
        }
    }
}
