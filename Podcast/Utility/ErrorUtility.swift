//
//  ErrorUtility.swift
//  Podcast
//
//  Created by Vlatko Šprem on 01.07.2022..
//

import Foundation

public enum PodcastError: Error {
    case decoderError
    case noDataError
    case responseError(errorCode: Int)
    
    func showErrorDialog() {
        switch self {
        case .decoderError:
            DialogUtility.createDialog(title: "Error",
                                       message: "Decoder error",
                                       actions: [DialogAction(title: "OK", style: .default, completion: nil)]).show()
         case .noDataError:
            DialogUtility.createDialog(title: "Error",
                                       message: "No podcast was found based on your search pattern!",
                                       actions: [DialogAction(title: "OK", style: .default, completion: nil)]).show()
                                                 
         case .responseError(errorCode: let errorCode):
            DialogUtility.createDialog(title: "Error",
                                       message: "Error with the response, status code: \(errorCode)",
                                       actions: [DialogAction(title: "OK", style: .default, completion: nil)]).show()
         }
    }
}


