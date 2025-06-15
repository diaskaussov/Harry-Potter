
import UIKit

protocol CloseButtonDelegate: AnyObject {
    func closeButtonTapped()
}

final class CloseButton: UIButton {
    private enum Constants {
        static let titleName: String = "Close"
        static let titleColor: UIColor = .white
        static let cornerRadius: CGFloat = 8
        static let backgroundColor: UIColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
            alpha: 1
        )
    }
    
    weak var delegate: CloseButtonDelegate?
    
    init() {
        super.init(frame: .zero)
        setupButtonProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonProperties() {
        setTitle(Constants.titleName, for: .normal)
        setTitleColor(Constants.titleColor, for: .normal)
        backgroundColor = Constants.backgroundColor
        layer.cornerRadius = Constants.cornerRadius
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        delegate?.closeButtonTapped()
    }
}
