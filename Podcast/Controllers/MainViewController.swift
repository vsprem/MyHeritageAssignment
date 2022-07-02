//
//  MainViewController.swift
//  Podcast
//
//  Created by Vlatko Šprem on 24.06.2022..
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    enum Constants {
        static let podCastListCelIdentifier = "PodcastListCell"
        static let estimatedRowHeight: CGFloat = 120
    }
    
    var viewModel: MainViewModel!
    
    private var clearBtnTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setupView()
    }
    
    private func setupView() {
        title = viewModel.header
        searchBar.searchTextField.delegate = self
        searchBar.placeholder = viewModel.searchBarPlaceholder
        tableView.register(UINib(nibName: Constants.podCastListCelIdentifier, bundle: nil), forCellReuseIdentifier: Constants.podCastListCelIdentifier)
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.podcastDetailsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let podcastDetails = viewModel.podcastDetailsData?[indexPath.row],
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.podCastListCelIdentifier) as? PodcastListCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.configureCell(podCastDetails: podcastDetails)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showPodcastDetails(indexOfPodcast: indexPath.row)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if clearBtnTapped {
            resignSearchBar()
        }
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        if clearBtnTapped {
            clearBtnTapped = false
            return false
        }
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text,
              searchText.count > 0,
              !clearBtnTapped else { return }
    
        activityView.startAnimating()
        viewModel.fetchPodcast(podcastName: searchText) { [weak self] error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.activityView.stopAnimating()
                
                if error == nil  {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        resignSearchBar()
    }
    
    private func resignSearchBar() {
        searchBar.resignFirstResponder()
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        clearBtnTapped = true
        
        viewModel.podcastDetailsData = nil
        tableView.reloadData()
        return true
    }
}
