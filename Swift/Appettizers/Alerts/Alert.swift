//
//  Alert.swift
//  Appetizers
//
//  Created by Kamil on 14/11/2023.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    
    //MARK: Network allerts
    static let invalidURL       =  AlertItem(title: Text("Invalid URL"),
                                            message: Text("There was an issue connectinng to the server"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error(URL)"),
                                            message: Text("invalid response from the server. Please try again later"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidData      = AlertItem(title: Text("Server Error(Data)"),
                                            message: Text("invalid response from the server. Please try again later"),
                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error(completion)"),
                                            message: Text("Unable to complete your request, please chceck your internet connection "),
                                            dismissButton: .default(Text("OK")))
    
    //MARK: Account allerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Make sure all fields in a form have been filled out"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Make sure your email is correct."),
                                            dismissButton: .default(Text("OK")))
    
    static let informationSaved = AlertItem(title: Text("information saved"),
                                            message: Text("You're all set"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("there was an error with your profile"),
                                           dismissButton: .destructive(Text("OK")))
    
    
}
 
