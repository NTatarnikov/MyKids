//
//  ContentView.swift
//  MyKids
//
//  Created by Nikita Tatarnikov on 23.11.2021.
//

import SwiftUI


struct ContentView: View {
    @State private var showingAddKid = false
    @State private var showingAlert = false
    @StateObject var parentKid = ParentKidModel()
    
    var body: some View {
        
        // Block with personal data
        VStack{
            VStack(alignment: .leading){
                Text("Персональные данные")
                    .font(.title2)
                VStack{
                    Text("Имя")
                        .textFieldHeader()
                    
                    TextField("Иван", text: $parentKid.parentName)
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
                    
                    TextField("27", text: $parentKid.parentAge)
                        .textFieldText()
                        .keyboardType(.decimalPad)
                }
                // Using this to make a nice border around text Field
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 1)
                )
            }
            .padding()
            
            // Block with Kids
            VStack{
                HStack{
                    
                    Text("Дети (макс.5)")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button("+  Добавить ребенка") {
                        showingAddKid.toggle()
                    }
                    .sheet(isPresented: $showingAddKid) {
                        AddView(parentKid: parentKid)
                    }
                    .disabled(parentKid.kids.count == 5)
                    .frame(width: 190, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }
                
                ScrollView{
                    if parentKid.kids.count > 0 {
                        // Using this to add kids to view and delete them in array
                        ForEach(Array(zip(parentKid.kids.indices, parentKid.kids)), id: \.1) { index, kid in
                            VStack(alignment: .leading){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Имя")
                                            .textFieldHeader()
                                        
                                        Text("\(kid.name ?? "Без имени")")
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
                                    
                                    Button("Удалить") {
                                        parentKid.kids.remove(at: index)
                                    }
                                }
                                VStack(alignment: .leading){
                                    Text("Возраст")
                                        .textFieldHeader()
                                    
                                    Text("\(kid.age ?? 0)")
                                        .textFieldText()
                                }
                                .frame(width: 200, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0.8,
                                                      green: 0.8,
                                                      blue: 0.8), lineWidth: 1)
                                )
                                .padding(.bottom)
                                if parentKid.kids.count > 1{
                                    Divider()
                                }
                            }
                        }
                        .padding(1)
                    }
                    
                    
                    Button("Очистить"){
                        showingAlert.toggle()
                    }
                    
                    // Alert for clear data
                    .alert("Сбросить все данные?", isPresented: $showingAlert) {
                        Button("Сбросить данные", role: .destructive) {
                            clearAllData()
                        }
                        Button("Отмена", role: .cancel) {
                            return
                        }
                    }
                    
                    .frame(width: 190, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.red, lineWidth: 1)
                    )
                    .foregroundColor(Color.red)
                }
            }
            .padding(EdgeInsets(top: -10, leading: 20, bottom: 10, trailing: 20))
            Spacer()
        }
        .padding()
        
        
    }
    
    // func to clear all data on screen
    func clearAllData() {
        parentKid.kids.removeAll()
        parentKid.parentName = ""
        parentKid.parentAge = String(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
