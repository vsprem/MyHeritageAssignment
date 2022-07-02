//
//  PodcastDetailsViewModel.swift
//  Podcast
//
//  Created by Vlatko Šprem on 29.06.2022..
//

import Foundation
import UIKit

class PodcastDetailsViewModel {
    
    private var podcastDetailsData: PodcastDetailsData
    
    public var header: String {
        return "Podcast details"
    }
    
    public var artistName: String {
        return podcastDetailsData.artistName ?? "N/A"
    }
    
    public var trackName: String {
        return podcastDetailsData.trackName ?? "N/A"
    }
    
    public var releaseDate: String {
        return podcastDetailsData.releaseDate?.getStringDate() ?? "N/A"
    }
    
    public var podcastImageName: String? {
        return podcastDetailsData.artworkUrl100
    }
    
    init(podcastDetailsData: PodcastDetailsData) {
        self.podcastDetailsData = podcastDetailsData
    }
    
    
    
}
