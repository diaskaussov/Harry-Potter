
import UIKit

final class IndividualSchoolViewController: UIViewController {
    
    private let schoolColor: UIColor
    
    private let schoolImage: UIImage
    
    private let schoolNameText: String
    
    private let schoolData: SchoolData
    
    private let schoolImageView: IndividualSchoolImageView
    
    private let scrollImageView: IndividualSchoolImageView
    
    private let backgroundView: IndividualSchoolBackgroundView
    
    private let schoolInfo: SchoolNameLabel
    
    init(image: UIImage, text: String, color: UIColor) {
        self.schoolImage = image
        
        self.schoolNameText = text
        
        self.schoolColor = color
        
        self.schoolData = SchoolData()
        
        self.schoolImageView = IndividualSchoolImageView(
            image: schoolImage,
            isScroll: false
        )
        
        self.scrollImageView = IndividualSchoolImageView(
            image: UIImage(named: "scroll") ?? UIImage(),
            isScroll: true
        )
        
        self.backgroundView = IndividualSchoolBackgroundView()
        
        self.schoolInfo = SchoolNameLabel(
            text: schoolData.schoolInfo[schoolNameText] ?? "No info",
            numberOfLines: 12,
            fontSize: 22.0
        )
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupConstraints()
        setDelegates()
    }
}

//MARK: - Setup View Controller

private extension IndividualSchoolViewController {
    private func addSubview() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(schoolImageView)
        backgroundView.addSubview(scrollImageView)
        scrollImageView.addSubview(schoolInfo)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            schoolImageView.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),
            schoolImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            schoolImageView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.5),
            schoolImageView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.25),
            
            scrollImageView.topAnchor.constraint(equalTo: schoolImageView.bottomAnchor),
            scrollImageView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 1.2),
            scrollImageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            scrollImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            
            schoolInfo.centerYAnchor.constraint(equalTo: scrollImageView.centerYAnchor),
            schoolInfo.centerXAnchor.constraint(equalTo: scrollImageView.centerXAnchor),
            schoolInfo.widthAnchor.constraint(equalTo: scrollImageView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func setDelegates() {
        scrollImageView.delegate = self
    }
}

//MARK: - IndividualSchoolImageViewDelegate

extension IndividualSchoolViewController: IndividualSchoolImageViewDelegate {
    func scrollImageTapped() {
        let vc = CharactersPageViewController(
            schoolName: schoolNameText,
            schoolColor: schoolColor
        )
        navigationController?.pushViewController(vc, animated: true)
    }
}
