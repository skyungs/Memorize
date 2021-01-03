//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Seoyoung Kyung on 12/26/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(of matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
