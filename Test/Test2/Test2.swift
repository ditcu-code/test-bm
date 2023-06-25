//
//  Test2.swift
//  Test
//
//  Created by Aditya Cahyo on 24/06/23.
//

import SwiftUI

struct Test2: View {
    @StateObject private var viewModel = Test2VM()
    
    var body: some View {
        VStack(spacing: 30) {
            
            Image(systemName: viewModel.isValid ? "checkmark.square.fill" : "xmark.square.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(viewModel.isValid ? .green : .red)
            
            VStack(spacing: 15) {
                TextField("", text: $viewModel.username, prompt: Text("Username"))
                SecureField("", text: $viewModel.password, prompt: Text("Password"))
                    .textContentType(.password)
                SecureField("", text: $viewModel.retypePassword, prompt: Text("Konfirmasi Password"))
                    .textContentType(.password)
            }.textFieldStyle(.roundedBorder)
            
            Button {
                print("authentication in process...")
            } label: {
                HStack {
                    Spacer()
                    Text("Login")
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.isValid)
            
        }
        .padding()
        .animation(.default, value: viewModel.isValid)
        .onChange(of: [viewModel.password, viewModel.username, viewModel.retypePassword]) { newValue in
            viewModel.formValidation()
        }
    }
}

class Test2VM: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var retypePassword: String = ""
    
    @Published var isValid: Bool = false
    
    func formValidation() {
        isValid = !username.isEmpty && !password.isEmpty && password == retypePassword
    }
}

struct Test2_Previews: PreviewProvider {
    static var previews: some View {
        Test2()
    }
}
