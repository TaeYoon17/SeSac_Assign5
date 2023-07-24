//
//  NewWordDummy.swift
//  assign
//
//  Created by 김태윤 on 2023/07/24.
//

import Foundation
enum CoinedType{
    case Rectal
    case Family
}
struct CoinedModel{
    let name:String
    let content:String
    let type:CoinedType
}

let dummyModel = [
    CoinedType.Family:[
        CoinedModel(name: "엄친아", content: "엄마 친구 아들1", type: .Family),
        .init(name: "엄친아2", content: "엄마 친구 아들2", type: .Family),
        .init(name: "엄친아3", content: "엄마 친구 아들3", type: .Family),
        .init(name: "엄친아4", content: "엄마 친구 아들4", type: .Family),
        .init(name: "엄친아5", content: "엄마 친구 아들5", type: .Family),
        .init(name: "엄친아6", content: "엄마 친구 아들6", type: .Family),
        .init(name: "엄친아7", content: "엄마 친구 아들7", type: .Family)
    ],
    .Rectal:[
        .init(name: "히뜩하다", content: "아이디어가 참신하고 반짝인다1", type: .Rectal),
        .init(name: "히뜩하다2", content: "아이디어가 참신하고 반짝인다2", type: .Rectal),
        .init(name: "히뜩하다3", content: "아이디어가 참신하고 반짝인다3", type: .Rectal),
        .init(name: "히뜩하다4", content: "아이디어가 참신하고 반짝인다4", type: .Rectal),
        .init(name: "히뜩하다5", content: "아이디어가 참신하고 반짝인다5", type: .Rectal),
        .init(name: "히뜩하다6", content: "아이디어가 참신하고 반짝인다6", type: .Rectal),
        .init(name: "히뜩하다7", content: "아이디어가 참신하고 반짝인다7", type: .Rectal)
    ]
]
