//
//  DateExtension.swift
//  Podcast
//
//  Created by Vlatko Šprem on 01.07.2022..
//

import Foundation

extension Date {
    func getStringDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return  dateFormatter.string(from: self)
    }
}
