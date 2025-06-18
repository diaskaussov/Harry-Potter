
import UIKit

final class CharacterInfoStackView: UIStackView {
    private enum Constants {
        static let spacing: CGFloat = 10
    }
    
    init() {
        super.init(frame: .zero)
        setupStackProperties()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackProperties() {
        axis = .vertical
        alignment = .leading
        spacing = Constants.spacing
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
}
