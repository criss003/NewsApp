//
//  RowTypeModel.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import Foundation

struct RowTypeModelConstants {
    static let receivedDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
    static let displayDateFormat = "dd.MM.yyyy"
    
    static let nameTitle = ""
    static let jobTitle = "Job Title"
    static let dateTitle = "Date Added"
    static let emailTitle = "Email"
    static let phoneTitle = "Phone Number"
    static let ageTitle = "Age"
}

enum RowTypeModel: Int, CaseIterable {
    case name
    case job
    case date
    case email
    case phone
    case age
    
    var title: String {
        switch self {
        case .name:
            return RowTypeModelConstants.nameTitle
        case .job:
            return RowTypeModelConstants.jobTitle
        case .date:
            return RowTypeModelConstants.dateTitle
        case .email:
            return RowTypeModelConstants.emailTitle
        case .phone:
            return RowTypeModelConstants.phoneTitle
        case .age:
            return RowTypeModelConstants.ageTitle
        }
    }
    
//    func value(articleModel: ArticleModel?) -> String? {
//        guard let contact = contactModel else {
//            return nil
//        }
//        
//        switch self {
//        case .name:
//            return contact.name
//        case .job:
//            return contact.jobTitle
//        case .date:
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = RowTypeModelConstants.receivedDateFormat
//            if let dateAdded = contact.dateAdded,
//                let date = dateFormatter.date(from: dateAdded) {
//                let displayDateFormatter = DateFormatter()
//                displayDateFormatter.dateFormat = RowTypeModelConstants.displayDateFormat
//                let displayDate = displayDateFormatter.string(from: date)
//                return displayDate
//            }
//            return nil
//        case .email:
//            return contact.email
//        case .phone:
//            return contact.phoneNumber
//        case .age:
//            if let age = contact.age {
//                return String(age)
//            } else {
//                return nil
//            }
//        }
//    }
//    
//    func avatar(contactModel: ArticleModel?) -> String? {
//        guard let contact = contactModel else {
//            return nil
//        }
//        
//        switch self {
//        case .name:
//            return contact.avatar
//        case .job, .date, .email, .phone, .age:
//            return nil
//        }
//    }
}

