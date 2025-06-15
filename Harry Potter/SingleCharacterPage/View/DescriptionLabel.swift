
import UIKit

final class DescriptionLabel: UILabel {
    private enum Constants {
        static let numberOfLines: Int = 0
        static let textColor: UIColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
            alpha: 1
        )
        static let typeTextFont = UIFont.systemFont(
            ofSize: 16,
            weight: .bold
        )
        static let descriptionTextFont = UIFont.systemFont(
            ofSize: 16,
            weight: .regular
        )
    }
    
    init(type: String, content: String) {
        super.init(frame: .zero)
        setupLabelProperties(type: type, content: content)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties(type: String, content: String) {
        textColor = Constants.textColor
        numberOfLines = Constants.numberOfLines
        translatesAutoresizingMaskIntoConstraints = false
        createAttributedText(type: type, content: content)
    }
    
    private func createAttributedText(type: String, content: String) {
        let attributedText = NSMutableAttributedString(
            string: type,
            attributes: [
                .font: Constants.typeTextFont
            ]
        )
        attributedText.append(
            NSAttributedString(
                string: content,
                attributes: [
                    .font: Constants.descriptionTextFont
                ]
            )
        )
        self.attributedText = attributedText
    }
}
