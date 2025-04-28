
import UIKit

final class SchoolsPageViewController: UIViewController {
    
    private let rollView: RollView
    
    private let gryffindor: FlagButton
    
    private let hufflepuff: FlagButton
    
    private let ravenclaw: FlagButton
    
    private let slyzerin: FlagButton
    
    private let backgroundView: SchoolsPageImageView
    
    private let owlView: SchoolsPageImageView
    
    init() {
        self.rollView = RollView()
        
        self.gryffindor = FlagButton(image: "g")
        
        self.hufflepuff = FlagButton(image: "h")
        
        self.ravenclaw = FlagButton(image: "r")
        
        self.slyzerin = FlagButton(image: "s")
        
        self.backgroundView = SchoolsPageImageView(name: "bluredLib")
        
        self.owlView = SchoolsPageImageView(name: "owl")
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        setDelegates()
    }
}

//MARK: - Setup View Controller

private extension SchoolsPageViewController {
    
    private func addSubviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(owlView)
        backgroundView.addSubview(gryffindor)
        backgroundView.addSubview(slyzerin)
        backgroundView.addSubview(hufflepuff)
        backgroundView.addSubview(ravenclaw)
        backgroundView.addSubview(rollView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            gryffindor.trailingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: -5),
            gryffindor.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            gryffindor.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),
            gryffindor.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            slyzerin.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 5),
            slyzerin.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            slyzerin.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),
            slyzerin.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            hufflepuff.trailingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: -5),
            hufflepuff.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            hufflepuff.topAnchor.constraint(equalTo: gryffindor.bottomAnchor, constant: 10),
            hufflepuff.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            ravenclaw.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 5),
            ravenclaw.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            ravenclaw.topAnchor.constraint(equalTo: slyzerin.bottomAnchor, constant: 10),
            ravenclaw.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            owlView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 5),
            owlView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            owlView.topAnchor.constraint(equalTo: hufflepuff.bottomAnchor, constant: 50),
            owlView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            rollView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            rollView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.6),
            rollView.topAnchor.constraint(equalTo: hufflepuff.bottomAnchor, constant: 30),
            rollView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.35)
        ])
    }
    
    private func setDelegates() {
        gryffindor.flagButtonDelegate = self
        hufflepuff.flagButtonDelegate = self
        ravenclaw.flagButtonDelegate = self
        slyzerin.flagButtonDelegate = self
    }
}

//MARK: - FlagButtonDelegate

extension SchoolsPageViewController: FlagButtonDelegate {
    func schoolButtonTapped(for sender: UIButton) {
        var schoolImage: UIImage
        
        var schoolName: String
        
        var schoolColor: UIColor
        
        switch sender {
            case slyzerin:
                guard let image = UIImage(named: "s") else { return }
                schoolImage = image
                schoolName = "Slytherin"
                schoolColor = .green
            
            case hufflepuff:
                guard let image = UIImage(named: "h") else { return }
                schoolImage = image
                schoolName = "Hufflepuff"
                schoolColor = .yellow
            
            case ravenclaw:
                guard let image = UIImage(named: "r") else { return }
                schoolImage = image
                schoolName = "Ravenclaw"
                schoolColor = .blue
            
            default:
                guard let image = UIImage(named: "g") else { return }
                schoolImage = image
                schoolName = "Gryffindor"
                schoolColor = .red
        }
        
        let vc = IndividualSchoolViewController(
            image: schoolImage,
            text: schoolName,
            color: schoolColor
        )
        navigationController?.pushViewController(vc, animated: true)
    }
}
