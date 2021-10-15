//
//  AddView.swift
//  TodoListSwiftUIDemo
//
//  Created by Julio Collado on 6/10/21.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle = "new item must be at least 3 characters long! ❌"
    @State var isAlertShown = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("item name", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 44)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .cornerRadius(11)
                Button(action: saveButtonTapped, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
            }
            .padding(14)
        }
        .navigationTitle("Add Item 🖋")
        .alert(isPresented: $isAlertShown, content: getAlert)
    }
    
    private func saveButtonTapped() {
        if isTextValid {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private var isTextValid: Bool {
        let isValid =  textFieldText.count > 3
        if !isValid {
            isAlertShown.toggle()
        }
        return isValid
    }
    
    private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle) )
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
       
    }
}
