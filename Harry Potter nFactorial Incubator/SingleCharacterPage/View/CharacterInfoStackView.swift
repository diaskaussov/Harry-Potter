
import UIKit

final class CharacterInfoStackView: UIStackView {
    
    init() {
        super.init(frame: .zero)
        setupStackProperties()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackProperties() {
        axis = .vertical
        spacing = 10
        distribution = .fillEqually
        alignment = .leading
        translatesAutoresizingMaskIntoConstraints = false
    }
}
