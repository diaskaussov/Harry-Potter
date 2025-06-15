
import UIKit

final class CellLabel: UILabel {
    private enum Constants {
        static let cornerRadius: CGFloat = 10
        static let textColor: UIColor = UIColor(
            red: 134/255,
            green: 59/255,
            blue: 5/255,
            alpha: 1
        )
    }
    
    init() {
        super.init(frame: .zero)
        setupLabelProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties() {
        textColor = Constants.textColor
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
}
