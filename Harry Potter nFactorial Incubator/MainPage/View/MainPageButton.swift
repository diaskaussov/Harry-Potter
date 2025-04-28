
import UIKit

protocol MainPageButtonDelegate: AnyObject {
    func mainPageButtonTapped()
}

final class MainPageButton: UIButton {
    
    weak var mainPageButtonDelegate: MainPageButtonDelegate?
    
    init() {
        super.init(frame: .zero)
        setupButtonProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonProperties() {
        layer.cornerRadius = 10
        setTitle("I'm ready!", for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        backgroundColor = UIColor(
            red: 234.0/255.0,
            green: 216.0/255.0,
            blue: 174.0/255.0,
            alpha: 1
        )
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        mainPageButtonDelegate?.mainPageButtonTapped()
    }
}
