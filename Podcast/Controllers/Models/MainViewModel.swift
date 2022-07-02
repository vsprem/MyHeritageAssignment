//
//  MainViewModel.swift
//  Podcast
//
//  Created by Vlatko Šprem on 26.06.2022..
//

import Foundation

class MainViewModel {
    
    public var delegate: MainCoordinatorDelegate!
    
    public var podcastDetailsData: [PodcastDetailsData]?
    
    public var header: String {
        return "Podcast"
    }
    
    public let searchBarPlaceholder = "Search"
    
    init(delegate: MainCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    public func fetchPodcast(podcastName: String, completion: @escaping (Error?) -> Void) {
        PodcastService.fetchPodcast(podcastName: podcastName) { [weak self] podcastDetailsData in
            guard let self = self else { return }
            self.podcastDetailsData = podcastDetailsData
            completion(nil)
        } failure: { error in
            completion(error)
            DispatchQueue.main.async {
                if let error = error as? PodcastError {
                    error.showErrorDialog()
                } else {
                    DialogUtility.createDialog(title: "Error",
                                               message: error.localizedDescription,
                                               actions: [DialogAction(title: "OK", style: .default, completion: nil)]).show()
                }
            }
        }
    }
    
    public func showPodcastDetails(indexOfPodcast: NSInteger) {
        guard let podcastDetails = podcastDetailsData?[indexOfPodcast] else { return }
        delegate.showPodcastDetails(podcastDetails: podcastDetails)
    }
    
    
}
