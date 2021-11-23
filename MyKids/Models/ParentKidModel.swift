//
//  ParentKidsModel.swift
//  MyKids
//
//  Created by Nikita Tatarnikov on 24.11.2021.
//

import Foundation

class ParentKidModel: ObservableObject {
    @Published var kids = [KidModel]()
    @Published var parentName: String
    @Published var parentAge: String
    
    init(){
        kids = []
        parentName = ""
        parentAge = ""
    }
}
