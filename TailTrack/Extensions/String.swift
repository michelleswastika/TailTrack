//
//  String.swift
//  TailTrack
//
//  Created by Nael on 08/05/23.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        // test@gmail.com -> true
        // test.com -> false
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
        
    }
    
    var containsEmoji: Bool {
            for scalar in unicodeScalars {
                switch scalar.value {
                case 0x1F600...0x1F64F, 0x1F300...0x1F5FF, 0x1F680...0x1F6FF, 0x2600...0x26FF, 0x2700...0x27BF, 0xE0020...0xE007F:
                    return true
                default:
                    continue
                }
            }
            return false
        }
    
//    func containsEmoji() -> Bool {
//        let emojiRanges = [
//            0x1F601...0x1F64F,
//            0x1F600...0x1F636,
//            0x1F681...0x1F6C5,
//            0x1F30D...0x1F567,
//            0x1F680,
//            0x1F6F0,
//            0x2600...0x26FF,
//            0x2700...0x27BF,
//            0x1F900...0x1F9FF,
//            0x1F170...0x1F251,
//            0x1F600...0x1F636
//        ] as [Any]
//
//        for scalar in unicodeScalars {
//            if emojiRanges.contains(where: { $0 as! UInt32 ~= scalar.value }) {
//                return true
//            }
//        }
//
//        return false
//    }
    
//    func containsEmoji() -> Bool {
//        let emojiPattern = #"[🥳🥰😃😄😅😆😂🤣😊😇🙂😎😍🤩😘😗😙😚🥸😋😛😝😜🤪🤨🧐🤓😕😟😔😞😣😢😭🤬🤯😳😫😱🤔🤗😏😶😐😑😒🙄😬😮🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳🥸🤡👹👺🤖👽👻👾🤖🎃😺😸 ]"#
//        return true
//
//    }
}
