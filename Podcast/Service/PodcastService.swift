//
//  PodcastService.swift
//  Podcast
//
//  Created by Vlatko Šprem on 26.06.2022..
//

import Foundation

class PodcastService {
    
    public static func fetchPodcast(podcastName: String, success: @escaping ([PodcastDetailsData]) -> Void, failure: @escaping (Error) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(podcastName)&entity=podcast") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            do {
                guard let urlResponse = urlResponse as? HTTPURLResponse else { throw PodcastError.responseError(errorCode: -1) }
                guard let data = data else { throw PodcastError.noDataError }
                
                if !(200...299).contains(urlResponse.statusCode) {
                    throw PodcastError.responseError(errorCode: urlResponse.statusCode)
                }

                let jsonDecoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                dateFormatter.locale = Locale.current
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let podcastData: PodcastData = try jsonDecoder.decode(PodcastData.self, from: data)
                if podcastData.results.count > 0 {
                    success(podcastData.results)
                } else {
                    throw PodcastError.noDataError
                }
            }
            catch let taskError {
                failure(taskError)
           }
        }
        task.resume()
    }
}
