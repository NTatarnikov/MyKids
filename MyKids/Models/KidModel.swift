//
//  kidModel.swift
//  MyKids
//
//  Created by Nikita Tatarnikov on 24.11.2021.
//

import Foundation

struct KidModel: Identifiable, Codable, Hashable{
    var id = UUID()
    let name: String?
    let age: Int?
}
