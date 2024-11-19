//
//  AccountView.swift
//  Appetizers
//
//  Created by Kamil on 13/11/2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Personal info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                            .foregroundColor(Color.brandPrimary)
                    }
                }
                
                Section("Requests"){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    
                }.tint(Color.brandPrimary)
                
                Text("")
            }
            .navigationTitle("Account")
            
        }.onAppear(){
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){ alerItem in
            Alert(title: alerItem.title, message: alerItem.message, dismissButton: alerItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
