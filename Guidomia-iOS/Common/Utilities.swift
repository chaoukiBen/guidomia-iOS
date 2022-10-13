//
//  Utilities.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import UIKit

struct Utilities {
    
    static func displayRating(rating: Int) -> NSMutableAttributedString {
        let fullString = NSMutableAttributedString()

        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "star.fill")?.withTintColor(.orange)
        let attachmentString = NSAttributedString(attachment: imageAttachment)

        for _ in 1 ... rating {
            fullString.append(attachmentString)
            fullString.append(NSAttributedString(string: " "))
        }

        return fullString
    }

    static func priceFormatter(price: Int) -> String {
        if price % 1000 == 0 {
            return "\(price/1000)K"
        } else {
            return "\(price)"
        }
    }
}
