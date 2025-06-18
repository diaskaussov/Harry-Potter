
import UIKit

protocol CharactersPagePresenterDelegate: AnyObject {
    func dataDownloaded()
}

final class CharactersPagePresenter {
    weak var charactersPagePresenterDelegate: CharactersPagePresenterDelegate?
    
    private let house: HouseModel
    private let charactersNetworkingService: CharactersNetworkingService
    
    private var charactersOfHouse: [IndividualCharacterInfo] = []
    private var filteredCharacters: [IndividualCharacterInfo] = []
    private var isSearching = false
    
    var numberOfCharactersInHouse: Int {
        return isSearching ? filteredCharacters.count : charactersOfHouse.count
    }
    
    init(house: HouseModel) {
        self.house = house
        self.charactersNetworkingService = CharactersNetworkingService()
        downloadData()
    }
}

//MARK: - Getters

extension CharactersPagePresenter {
    func getHouseName() -> String {
        return house.name
    }
    
    func getCharacterName(for index: Int) -> String {
        let character = isSearching ? filteredCharacters[index] : charactersOfHouse[index]
        guard let name = character.name else { return "" }
        return name
    }
    
    func getCharacterImage(for index: Int) -> UIImage? {
        let character = isSearching ? filteredCharacters[index] : charactersOfHouse[index]
        return character.image
    }
    
    func getCharacterRole(for index: Int) -> String {
        let character = isSearching ? filteredCharacters[index] : charactersOfHouse[index]
        
        if let isStudent = character.hogwartsStudent {
            if isStudent {
                return "student"
            }
        }
        
        if let isStaff = character.hogwartsStaff {
            if isStaff {
                return "staff"
            }
        }
        
        return "not student/staff"
    }
    
    func getCharacterInfo(for index: Int) -> IndividualCharacterInfo {
        return isSearching ? filteredCharacters[index] : charactersOfHouse[index]
    }
}

//MARK: - Api Calls

private extension CharactersPagePresenter {
    private func downloadData() {
        charactersNetworkingService.fetchCharactersForHouse(house.name) { [weak self] result in
            
            guard let self = self else { return }
            
            if let characters = result {
                downloadImage(rawData: characters)
            }
        }
    }
    
    private func downloadImage(rawData: [rawDataOfCharacters]) {
        self.charactersNetworkingService.downloadCharacterImages(characters: rawData) { [weak self] info in
            
            guard let self = self else { return }
            
            self.charactersOfHouse = info
            
            DispatchQueue.main.async {
                self.charactersPagePresenterDelegate?.dataDownloaded()
            }
        }
    }
}

//MARK: - Search

extension CharactersPagePresenter {
    func searchCharacters(with searchText: String) {
        if searchText.isEmpty {
            isSearching = false
        } else {
            isSearching = true
            filteredCharacters = charactersOfHouse.filter { character in
                guard let name = character.name else { return false }
                return name.lowercased().hasPrefix(searchText.lowercased())
            }
        }
    }
}
