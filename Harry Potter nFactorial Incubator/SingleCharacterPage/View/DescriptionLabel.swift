
import UIKit

final class DescriptionLabel: UILabel {
    
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    init(type: String, content: String) {
        super.init(frame: .zero)
        setupLabelProperties(type: type, content: content)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties(type: String, content: String) {
//        text = type + content
        numberOfLines = 0
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 16, weight: .bold)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: type, attributes: [
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ])
        
        attributedText.append(NSAttributedString(string: content, attributes: [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ]))
        
        self.attributedText = attributedText
        
        textColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
            alpha: 1
        )
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + padding.left + padding.right,
            height: size.height + padding.top + padding.bottom
        )
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        return CGSize(
            width: size.width + padding.left + padding.right,
            height: size.height + padding.top + padding.bottom
        )
    }
}
