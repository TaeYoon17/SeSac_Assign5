//
//  EmotionType.swift
//  assign
//
//  Created by 김태윤 on 2023/07/26.
//

import Foundation

enum EmotionType:Int,CaseIterable,Hashable{
    case SuperHappy
    case Happy
    case Normal
    case Cloudy
    case SuperCloudy
    
    var myKorean:String{
        switch self{
        case .Cloudy: return "Cloudy"
        case .Happy: return "Happy"
        case .Normal: return "Normal"
        case .SuperCloudy: return "SuperCloudy"
        case .SuperHappy: return "SuperHappy"
        }
    }
}
