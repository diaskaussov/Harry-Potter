
import UIKit

protocol CharactersPagePresenterDelegate: AnyObject {
    func dataDownloaded()
}

final class CharactersPagePresenter {
    
    weak var charactersPagePresenterDelegate: CharactersPagePresenterDelegate?

    private let house: String
    
    private let charactersNetworkingService: CharactersNetworkingService
    
    private var charactersOfHouse: [IndividualCharacterInfo] = []
    
    private var filteredCharacters: [IndividualCharacterInfo] = []
    
    private var isSearching = false
    
    init(houseName: String) {
        self.house = houseName
        
        self.charactersNetworkingService = CharactersNetworkingService()
        
        makeApiCall()
    }
}

//MARK: - Api Calls

private extension CharactersPagePresenter {
    private func makeApiCall() {
        charactersNetworkingService.fetchCharactersForHouse(house) { [weak self] result in
            
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

//MARK: - Getters

extension CharactersPagePresenter {
    func getNumberOfCharacters() -> Int {
        return isSearching ? filteredCharacters.count : charactersOfHouse.count
    }
    
    func getFirstLetter() -> String {
        guard let char = house.first?.lowercased() else { return "g" }
        return char
    }
    
    func getName(for index: Int) -> String {
        let character = isSearching ? filteredCharacters[index] : charactersOfHouse[index]
        guard let name = character.name else { return "" }
        return name
    }
    
    func getImage(for index: Int) -> UIImage? {
        let character = isSearching ? filteredCharacters[index] : charactersOfHouse[index]
        return character.image
    }
    
    func getPosition(for index: Int) -> String {
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
    
    func getIndividualCharacter(for index: Int) -> IndividualCharacterInfo {
        return isSearching ? filteredCharacters[index] : charactersOfHouse[index]
    }
}
