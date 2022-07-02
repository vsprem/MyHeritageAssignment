//
//  PodcastListCell.swift
//  Podcast
//
//  Created by Vlatko Šprem on 29.06.2022..
//

import UIKit

class PodcastListCell: UITableViewCell {
    
    @IBOutlet weak var imgPodcast: UIImageView!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblTrack: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func configureCell(podCastDetails: PodcastDetailsData) {
        lblArtist.text = podCastDetails.artistName
        lblTrack.text = podCastDetails.trackName
        imgPodcast.downloadImageFrom(link: podCastDetails.artworkUrl100, placeholder: "no_img", contentMode: .scaleAspectFit)
    }
    
}
