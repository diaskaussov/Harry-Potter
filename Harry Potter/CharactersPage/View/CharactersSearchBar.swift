
import UIKit

final class CharactersSearchBar: UISearchBar {
    private enum Constants {
        static let placeholder: String = "Search characters"
        static let keyForTextField: String = "searchField"
        static let tintColor: UIColor = .darkGray
        static let cornerRadius: CGFloat = 10
        static let alphaComponent: CGFloat = 0.7
    }
    
    init() {
        super.init(frame: .zero)
        setupSearchBarProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSearchBarProperties() {
        tintColor = Constants.tintColor
        placeholder = Constants.placeholder
        backgroundColor = .clear
        barTintColor = .clear
        searchBarStyle = .minimal
        returnKeyType = .search
        showsCancelButton = false
        showsBookmarkButton = false
        translatesAutoresizingMaskIntoConstraints = false
        
        if let textField = self.value(forKey: Constants.keyForTextField) as? UITextField {
            textField.backgroundColor = UIColor.white.withAlphaComponent(Constants.alphaComponent)
            textField.layer.cornerRadius = Constants.cornerRadius
            textField.clipsToBounds = true
        }
    }
}
