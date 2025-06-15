
import UIKit

final class HouseLabel: UILabel {
    private enum Constants {
        static let numberOfLines: Int = 12
        static let cornerRadius: CGFloat = 10
        static let font = UIFont(name: "DancingScriptOT", size: 25)
        static let textColor: UIColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
            alpha: 1
        )
    }
    
    init(text: String) {
        super.init(frame: .zero)
        setupLabelProperties(content: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties(content: String) {
        text = content
        font = Constants.font
        textAlignment = .center
        textColor = Constants.textColor
        numberOfLines = Constants.numberOfLines
        layer.masksToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        translatesAutoresizingMaskIntoConstraints = false
    }
}
