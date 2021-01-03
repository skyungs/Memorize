//
//  Array+Only.swift
//  Memorize
//
//  Created by Seoyoung Kyung on 12/26/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
