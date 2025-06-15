
import UIKit

final class RollLabel: UILabel {
    private enum Constants {
        static let text: String =
        "Hogwarts has four Houses of Witchcraft and Wizardry.\nChoose one to be invited."
        static let numberOfLines: Int = 0
        static let cornerRadius: CGFloat = 10
        static let font = UIFont(name: "DancingScriptOT", size: 25)
        static let textColor: UIColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
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
        text = Constants.text
        textColor = Constants.textColor
        textAlignment = .center
        font = Constants.font
        numberOfLines = Constants.numberOfLines
        layer.cornerRadius = Constants.cornerRadius
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
