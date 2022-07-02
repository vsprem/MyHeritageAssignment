//
//  MainCoordinator.swift
//  Podcast
//
//  Created by Vlatko Šprem on 26.06.2022..
//

import UIKit

class MainCoordinator {
    
    private var navigationController: UINavigationController
    
    private var mainViewController: MainViewController? {
        let mainViewController = MainViewController.instantiate(fromStoryboard: .main)
        mainViewController?.viewModel = MainViewModel(delegate: self)
        return mainViewController
    }
    
    required public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        setupWindow()
    }
    
    public func setupWindow() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = appDelegate?.window,
           let mainViewController = mainViewController {
            window.rootViewController = navigationController
            navigationController.setViewControllers([mainViewController], animated: false)
            window.makeKeyAndVisible()
        }
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    func showPodcastDetails(podcastDetails: PodcastDetailsData) {
        if let podcastDetailsVC = PodcastDetailsViewController.instantiate(fromStoryboard: .main) {
            podcastDetailsVC.viewModel = PodcastDetailsViewModel(podcastDetailsData: podcastDetails)
            self.navigationController.pushViewController(podcastDetailsVC, animated: true)
        }
    }
}
