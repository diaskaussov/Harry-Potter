
import UIKit

final class SchoolNameLabel: UILabel {
    
    init(
        text: String,
        numberOfLines: Int,
        fontSize: CGFloat
    ) {
        
        super.init(frame: .zero)
        
        setupLabelProperties(
            content: text,
            num: numberOfLines,
            size: fontSize
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelProperties(
        content: String,
        num: Int,
        size: CGFloat
    ) {
        
        text = content
        numberOfLines = num
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
