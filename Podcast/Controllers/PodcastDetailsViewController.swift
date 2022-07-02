//
//  PodcastDetailsViewController.swift
//  Podcast
//
//  Created by Vlatko Šprem on 29.06.2022..
//

import UIKit

class PodcastDetailsViewController: UIViewController {

    @IBOutlet weak var imgPodcast: UIImageView!
    @IBOutlet weak var lblArtistName: PaddingLabel!
    @IBOutlet weak var lblTrackName: PaddingLabel!
    @IBOutlet weak var lblReleaseDate: PaddingLabel!
    
    public var viewModel: PodcastDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.header
        
        setupView()
    }
    
    private func setupView() {
        lblArtistName.layer.cornerRadius = 5
        lblArtistName.layer.masksToBounds = true
        lblArtistName.layer.borderWidth = 1
        lblArtistName.layer.borderColor = UIColor.gray.cgColor
        lblArtistName.padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        
        lblTrackName.layer.cornerRadius = 5
        lblTrackName.layer.masksToBounds = true
        lblTrackName.layer.borderWidth = 1
        lblTrackName.layer.borderColor = UIColor.gray.cgColor
        lblTrackName.padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        lblReleaseDate.layer.cornerRadius = 5
        lblReleaseDate.layer.masksToBounds = true
        lblReleaseDate.layer.borderWidth = 1
        lblReleaseDate.layer.borderColor = UIColor.gray.cgColor
        lblReleaseDate.padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        
        imgPodcast.downloadImageFrom(link: viewModel.podcastImageName, placeholder: "no_img", contentMode: .scaleToFill)
        lblArtistName.text = viewModel.artistName
        lblTrackName.text = viewModel.trackName
        lblReleaseDate.text = viewModel.releaseDate
    }

    

}
