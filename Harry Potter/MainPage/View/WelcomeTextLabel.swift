
import UIKit

final class WelcomeTextLabel: UILabel {
    private enum Constants {
        static let numberOfLines: Int = 0
        static let cornerRadius: CGFloat = 10
        static let font = UIFont(name: "DancingScriptOT", size: 35)
        static let textColor: UIColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
            alpha: 1
        )
    }
    
    init(text: String) {
        super.init(frame: .zero)
        setupLabelProperties(labelText: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties(labelText: String) {
        text = labelText
        textColor = Constants.textColor
        textAlignment = .center
        font = Constants.font
        numberOfLines = Constants.numberOfLines
        layer.cornerRadius = Constants.cornerRadius
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
