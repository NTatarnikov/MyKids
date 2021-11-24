//
//  addKid.swift
//  MyKids
//
//  Created by Nikita Tatarnikov on 24.11.2021.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var parentKid: ParentKidModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var age = 0
    
    
    var body: some View {
        NavigationView{
            List {
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Имя")
                                .textFieldHeader()
                            
                            TextField("Имя", text: $name)
                                .textFieldText()
                        }
                        .frame(width: 200, height: 50, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.8,
                                              green: 0.8,
                                              blue: 0.8), lineWidth: 1)
                        )
                        Spacer()
                    }
                    VStack(alignment: .leading){
                        Text("Возраст")
                            .textFieldHeader()
                        
                        TextField("13", value: $age, format: .number)
                            .textFieldText()
                            .keyboardType(.decimalPad)
                    }
                    .frame(width: 200, alignment: .leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.8,
                                          green: 0.8,
                                          blue: 0.8), lineWidth: 1)
                    )
                }
                .padding()
            }
            .listStyle(.plain)
            
            
            .navigationTitle("Добавить ребенка")
            .toolbar {
                Button("Сохранить") {
                    let kid = KidModel(name: name, age: age)
                    parentKid.kids.append(kid)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(parentKid: ParentKidModel())
    }
}


