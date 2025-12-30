//
//  Post.swift
//  Vision-os-labs
//
//  Created by swapnil on 10/27/25.
//

import Foundation

struct Post: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
