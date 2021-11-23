//
//  Styles.swift
//  MyKids
//
//  Created by Nikita Tatarnikov on 23.11.2021.
//

import SwiftUI

// MARK: Making modifiers to minimize Content view code

// Making styles for Text View Header
struct TextFieldHeader: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(EdgeInsets(top: 5, leading: 10, bottom: -10, trailing: 0))
      .frame(maxWidth: .infinity, alignment: .leading)
      .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
  }
}

// Making styles for Text View Text itself
struct TextFieldText: ViewModifier {
  func body(content: Content) -> some View {
    content
//      .frame(width: .infinity, height: 40)
      .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 0))
      .disableAutocorrection(true)
//      .frame(width: .infinity, height: 30)
  }
}

// Extension view to not to write .modifier every time
extension View {
    func textFieldHeader() -> some View {
        modifier(TextFieldHeader())
    }
    
    func textFieldText() -> some View {
        modifier(TextFieldText())
    }
}
