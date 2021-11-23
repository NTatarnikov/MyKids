//
//  ContentView.swift
//  MyKids
//
//  Created by Nikita Tatarnikov on 23.11.2021.
//

import SwiftUI


struct ContentView: View {
    @State private var parentFirstName = ""
    @State private var parentAge = ""
    
    var body: some View {
        NavigationView {
//            Section{
                VStack{
                    VStack(alignment: .leading){
                        Text("Персональные данные")
                            .font(.title2)
                        VStack{
                            Text("Имя")
                                .textFieldHeader()
                                
                            TextField("Иван", text: $parentFirstName)
                                .textFieldText()
                        }
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 0.8,
                                                  green: 0.8,
                                                  blue: 0.8), lineWidth: 1)
                            )
                        VStack{
                            Text("Возраст")
                                .textFieldHeader()
                                
                            TextField("27", text: $parentAge)
                                .textFieldText()
                                .keyboardType(.decimalPad)
                        }
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 1)
                            )
                    }
                }
                .padding()
                
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
