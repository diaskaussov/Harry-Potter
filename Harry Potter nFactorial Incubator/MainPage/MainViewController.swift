
import UIKit

final class MainViewController: UIViewController {
    
    private let backgroundImageView: BackgroundView
    
    private let platformImageView: MainPageImageView
    
    private let scrollImageView: MainPageImageView
    
    private let welcomeText: WelcomeText
    
    
    init() {
        self.backgroundImageView = BackgroundView()
        
        self.platformImageView = MainPageImageView(name: "platform2")
        
        self.scrollImageView = MainPageImageView(name: "horscroll")
        
        self.welcomeText = WelcomeText()
        
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

private extension MainViewController {
    private func addSubview() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(platformImageView)
        backgroundImageView.addSubview(scrollImageView)
        scrollImageView.addSubview(welcomeText)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            platformImageView.topAnchor.constraint(equalTo: backgroundImageView.safeAreaLayoutGuide.topAnchor),
            platformImageView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor, multiplier: 0.4),
            platformImageView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor, multiplier: 0.2),
            platformImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            
            scrollImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            scrollImageView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 50),
            scrollImageView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor, multiplier: 0.8),
            scrollImageView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor, multiplier: 0.35),
            
            welcomeText.centerYAnchor.constraint(equalTo: scrollImageView.centerYAnchor),
            welcomeText.centerXAnchor.constraint(equalTo: scrollImageView.centerXAnchor),
            welcomeText.widthAnchor.constraint(equalTo: scrollImageView.widthAnchor, multiplier: 0.9)
        ])
    }
    
    private func setDelegates() {
        scrollImageView.delegate = self
    }
}

//MARK: - MainPageImageViewDelegate

extension MainViewController: MainPageImageViewDelegate {
    func didScrollImageTapped() {
        let vc = SchoolsPageViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
