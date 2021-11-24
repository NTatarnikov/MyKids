//
//  ParentKidsModel.swift
//  MyKids
//
//  Created by Nikita Tatarnikov on 24.11.2021.
//

import Foundation

// Parent kid model
class ParentKidModel: ObservableObject {
    @Published var kids = [KidModel]() {
        // Encoding a kids array to Json to save it in UserDefaults
        didSet{
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(kids) {
                UserDefaults.standard.set(encoded, forKey: "Kids")
            }
        }
    }
    
    // Setting parent name and age to user defaults
    @Published var parentName: String {
        didSet{
            UserDefaults.standard.set(parentName, forKey: "ParentName")
        }
    }
    @Published var parentAge: String {
        didSet{
            UserDefaults.standard.set(parentAge, forKey: "ParentAge")
        }
    }
    
    init() {
        // If saved kids already exist in our User Defaults - get them from there
        // If not - set empty array for kids
        if let savedKids = UserDefaults.standard.data(forKey: "Kids") {
            if let decodedKids = try? JSONDecoder().decode([KidModel].self, from: savedKids) {
                kids = decodedKids
            }
        } else {
            kids = []
        }
        // Get parent name and age from UserDefault, otherwise set it to ""
        parentName = UserDefaults.standard.string(forKey: "ParentName") ?? ""
        parentAge = UserDefaults.standard.string(forKey: "ParentAge") ?? ""
    }
}
