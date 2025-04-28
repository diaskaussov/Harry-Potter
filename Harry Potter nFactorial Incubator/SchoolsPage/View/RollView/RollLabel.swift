
import UIKit

final class RollLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        setupLabelProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties() {
        text = "Hogwarts has four Houses of Witchcraft and Wizardry.\nChoose one to be invited."
        numberOfLines = 0
        textAlignment = .center
        layer.cornerRadius = 10
        layer.masksToBounds = true
        font = UIFont(name: "DancingScriptOT", size: 25)
        textColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
            alpha: 1
        )
        translatesAutoresizingMaskIntoConstraints = false
    }
}
