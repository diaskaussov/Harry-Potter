
import SwiftUI

final class SpellsPageManager: ObservableObject {
    private let networkUrl = "https://hp-api.onrender.com/api/spells"
    private let networkManager = NetworkManager()
    
    @Published var spells: [Spell] = []
    
    init() {
        downloadData()
    }
    
    private func downloadData() {
        networkManager.downloadData(with: networkUrl) { [weak self] result in
            guard let result else { return }
            DispatchQueue.main.async {
                self?.spells = result
            }
        }
    }
}
