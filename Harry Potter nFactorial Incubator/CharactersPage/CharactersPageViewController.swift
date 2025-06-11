
import UIKit

final class CharactersPageViewController: UIViewController {
    
    private let house: HouseModel
    private let presenter: CharactersPagePresenter
    private let charactersSearchBar = CharactersSearchBar()
    private let backgroundView = CharachtersPageBackgroundView()
    private let charactersCollectionView = CharactersCollectionView()
    
    private let activityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    init(house: HouseModel) {
        self.house = house
        self.presenter = CharactersPagePresenter(house: house)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configure()
        showActivityIndicator()
    }
}

//MARK: - Setup View Controller

private extension CharactersPageViewController {
    private func setupSubviews() {
        view.addSubview(activityIndicator)
        view.addSubview(backgroundView)
        backgroundView.addSubview(charactersCollectionView)
        backgroundView.addSubview(charactersSearchBar)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            charactersSearchBar.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),
            charactersSearchBar.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.95),
            charactersSearchBar.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            charactersSearchBar.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.06),
            
            charactersCollectionView.topAnchor.constraint(equalTo: charactersSearchBar.bottomAnchor),
            charactersCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            charactersCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
    }
    
    private func configure() {
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        presenter.charactersPagePresenterDelegate = self
        charactersSearchBar.delegate = self
        configureGesture()
    }
    
    private func showActivityIndicator() {
        view.backgroundColor = house.color
        activityIndicator.startAnimating()
        charactersCollectionView.isHidden = true
        charactersSearchBar.isHidden = true
        backgroundView.isHidden = true
    }
    
    private func configureGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension CharactersPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfCharactersInHouse
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath
        ) as! CustomCollectionViewCell
        
        cell.configure(
            name: presenter.getCharacterName(for: indexPath.row),
            image: presenter.getCharacterImage(for: indexPath.row),
            isStudent: presenter.getCharacterRole(for: indexPath.row),
            houseName: presenter.getHouseName()
        )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = presenter.getCharacterInfo(for: indexPath.row)
        
        let vc = SingleCharacterViewController(
            character: selectedCharacter,
            firstLetter: presenter.getHouseName()
        )
        navigationController?.present(vc, animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CharactersPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let contentWidth = collectionView.bounds.width * 0.9
        
        let spacing: CGFloat = 10
        
        let itemWidth = (contentWidth - spacing) / 2
        
        return CGSize(width: itemWidth, height: itemWidth * 1.5)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        let totalWidth = collectionView.bounds.width
        
        let contentWidth = totalWidth * 0.9
        
        let horizontalInset = (totalWidth - contentWidth) / 2
        
        return UIEdgeInsets(top: 10, left: horizontalInset, bottom: 10, right: horizontalInset)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 10
    }
}

//MARK: - CharactersPagePresenterDelegate

extension CharactersPageViewController: CharactersPagePresenterDelegate {
    func dataDownloaded() {
        activityIndicator.stopAnimating()
        backgroundView.isHidden = false
        charactersCollectionView.isHidden = false
        charactersSearchBar.isHidden = false
        charactersCollectionView.reloadData()
    }
}

//MARK: - UISearchBarDelegate

extension CharactersPageViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.searchCharacters(with: searchText)
        charactersCollectionView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        presenter.searchCharacters(with: "")
        searchBar.resignFirstResponder()
        charactersCollectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
