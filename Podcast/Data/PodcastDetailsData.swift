//
//  PodcastData.swift
//  Podcast
//
//  Created by Vlatko Šprem on 28.06.2022..
//

import Foundation
import CoreText

struct PodcastDetailsData: Codable {
    public var artistName: String?
    public var trackName: String?
    public var releaseDate: Date?
    public var artworkUrl100: String?
    
    init(artistName: String?, trackName: String?, releaseDate: Date?, artworkUrl100: String?) {
        self.artistName = artistName
        self.trackName = trackName
        self.releaseDate = releaseDate
        self.artworkUrl100 = artworkUrl100
    }
}
