//
//  ContentView.swift
//  MyKids
//
//  Created by Nikita Tatarnikov on 23.11.2021.
//

// TODO: Add a save button under anyting

import SwiftUI


struct ContentView: View {
    @State private var showAddKid = false
    @StateObject var parentKid = ParentKidModel()
    
    var body: some View {
//        NavigationView {
//            Section{
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
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 1)
                            )
                    }
                    .padding()
                    
                    VStack{
                        HStack{
                            
                            Text("Дети (макс.5)")
                                .font(.title2)
                            
                            Spacer()
                            
                            Button("+  Добавить ребенка") {
                                showAddKid.toggle()
                            }
                            .sheet(isPresented: $showAddKid) {
                                AddView(parentKid: parentKid)
                            }
                            .disabled(parentKid.kids.count == 5)
                            .frame(width: 190, height: 50)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                            )
                        }
                        if parentKid.kids.count > 0 {
                            ScrollView{
                            ForEach(parentKid.kids) { kid in
                            VStack(alignment: .leading){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Имя")
                                            .textFieldHeader()
                                        Text("\(kid.name ?? "")")
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
                                        //
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
                                Divider()
                            }
                                }
                            .padding(1)
                            }
                        }
                        
                        
                    }
                    .padding(EdgeInsets(top: -10, leading: 20, bottom: 10, trailing: 20))
                    Spacer()
                }
                .padding()
                
//            }
            
        }
    
    func delete(at offsets: IndexSet) {
        parentKid.kids.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
