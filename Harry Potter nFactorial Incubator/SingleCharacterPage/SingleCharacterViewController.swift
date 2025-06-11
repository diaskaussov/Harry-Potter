
import UIKit

final class SingleCharacterViewController: UIViewController {
    
    private let closeButton: CloseButton
    
    private let presenter: SingleCharacterPresenter
    
    private let infoStackView: CharacterInfoStackView
    
    private let profileImageView: CharacterProfileImageView
    
    private let backgroundView: SingleCharacterBackgroundView
    
    private let infoScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private var infoLabels: [CharacterInfoType: DescriptionLabel] = [:]
    
    init(character: IndividualCharacterInfo, house: HouseModel) {
        self.presenter = SingleCharacterPresenter(
            character: character,
            house: house
        )
        
        self.profileImageView = CharacterProfileImageView(
            image: presenter.getImage()
        )
        
        self.infoStackView = CharacterInfoStackView()
        
        self.backgroundView = SingleCharacterBackgroundView()
        
        self.closeButton = CloseButton()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createInfoLabels()
        
        addSubviews()
        setupConstraints()
        setDelegates()
    }
    
    private func createInfoLabels() {
        presenter.getAllInfoTypes().forEach { infoType in
            let label = DescriptionLabel(
                type: infoType.label,
                content: presenter.getInfo(for: infoType)
            )
            infoLabels[infoType] = label
        }
    }
    
}

//MARK: - Setup View Controller

private extension SingleCharacterViewController {
    private func addSubviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(profileImageView)
        backgroundView.addSubview(infoScrollView)
        backgroundView.addSubview(closeButton)
        infoScrollView.addSubview(infoStackView)
        
        presenter.getAllInfoTypes().forEach { infoType in
            if let label = infoLabels[infoType] {
                infoStackView.addArrangedSubview(label)
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor, constant: 36),
            profileImageView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.7),
            profileImageView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.4),
            profileImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            closeButton.bottomAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.bottomAnchor),
            closeButton.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            closeButton.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.1),
            closeButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            infoScrollView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            infoScrollView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            infoScrollView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            infoScrollView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -10),
            
            infoStackView.topAnchor.constraint(equalTo: infoScrollView.topAnchor),
            infoStackView.widthAnchor.constraint(equalTo: infoScrollView.widthAnchor, multiplier: 0.9),
            infoStackView.centerXAnchor.constraint(equalTo: infoScrollView.centerXAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor)
        ])
    }
    
    private func setDelegates() {
        closeButton.delegate = self
    }
}

//MARK: - CloseButtonDelegate

extension SingleCharacterViewController: CloseButtonDelegate {
    func closeButtonTapped() {
        dismiss(animated: true)
    }
}
