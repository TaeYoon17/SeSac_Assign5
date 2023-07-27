//
//  CollectionExtension.swift
//  assign
//
//  Created by 김태윤 on 2023/07/27.
//
import Foundation

extension Collection{
    public subscript(safe idx:Index)->Element?{
        self.indices.contains(idx) ? self[idx] : nil
    }
}
