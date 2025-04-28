
import UIKit

final class WelcomeText: UILabel {
    
    init() {
        super.init(frame: .zero)
        setupLabelProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties() {
        text = "Welcome, traveler!\nAre you ready to dive into the world of Harry Potter?\nIf you are, click here!"
        numberOfLines = 0
        textAlignment = .center
        layer.cornerRadius = 10
        layer.masksToBounds = true
        font = UIFont(name: "DancingScriptOT", size: 35)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
            alpha: 1
        )
    }
}
