
import UIKit

final class CharactersSearchBar: UISearchBar {
    
    init() {
        super.init(frame: .zero)
        setupSearchBarProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSearchBarProperties() {
        tintColor = .darkGray
        placeholder = "Search characters"
        backgroundColor = .clear
        barTintColor = .clear
        searchBarStyle = .minimal
        returnKeyType = .search
        showsCancelButton = false
        showsBookmarkButton = false
        translatesAutoresizingMaskIntoConstraints = false
        
        if let textField = self.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.white.withAlphaComponent(0.7)
            textField.layer.cornerRadius = 10
            textField.clipsToBounds = true
        }
    }
    
}
