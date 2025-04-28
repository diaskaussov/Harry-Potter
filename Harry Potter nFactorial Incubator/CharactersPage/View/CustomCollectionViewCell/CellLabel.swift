
import UIKit

final class CellLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        setupLabelProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties() {
        textAlignment = .center
        layer.cornerRadius = 10
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
