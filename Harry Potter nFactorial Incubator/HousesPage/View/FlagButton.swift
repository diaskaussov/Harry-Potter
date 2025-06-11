
import UIKit

protocol FlagButtonDelegate: AnyObject {
    func flagButtonTapped(for houseType: HouseType)
}

final class FlagButton: UIButton {
    weak var flagButtonDelegate: FlagButtonDelegate?
    
    private let houseType: HouseType
    
    init(houseType: HouseType) {
        self.houseType = houseType
        super.init(frame: .zero)
        setupButtonConstraints(image: houseType.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonConstraints(image: String) {
        setImage(UIImage(named: image) ?? UIImage(), for: .normal)
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        flagButtonDelegate?.flagButtonTapped(for: houseType)
    }
}
