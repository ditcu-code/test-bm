//
//  Test5a.swift
//  Test
//
//  Created by ACI on 29/08/22.
//

import SwiftUI

// TODO: Login Screen (Test5a)

struct LoginView: View {
    @StateObject private var vm = LoginVM()
    
    var body: some View {
        VStack(spacing: 30) {
            
            TitleView()
            
            if !vm.errorMessage.isEmpty {
                ErrorMessageView(message: vm.errorMessage)
            }
            
            VStack(alignment: .trailing, spacing: 20) {
                HStack {
                    Image(systemName: "person").frame(width: 30)
                    VStack(spacing: 5) {
                        TextField("Username", text: $vm.username)
                            .textContentType(.username)
                            .accessibilityIdentifier("emailTextField")
                        Divider()
                    }
                }
                
                HStack {
                    Image(systemName: "lock").frame(width: 30)
                    VStack(spacing: 5) {
                        SecureField("Password", text: $vm.password)
                            .textContentType(.password)
                            .accessibilityIdentifier("passwordTextField")
                        Divider()
                    }
                }
                
                HStack {
                    Image(systemName: "laptopcomputer.and.iphone").frame(width: 30)
                    VStack(spacing: 5) {
                        TextField("Via", text: $vm.via)
                            .accessibilityIdentifier("viaTextField")
                        Divider()
                    }
                }
            }
            
            Button {
                
            } label: {
                Spacer()
                if vm.loading {
                    CircularLoading()
                } else {
                    Text("Login")
                        .padding(.horizontal)
                }
                Spacer()
            }
            .buttonStyle(.borderedProminent)
            .accessibilityIdentifier("loginButton")
            
        }.padding()
        
    }
}

fileprivate struct TitleView: View {
    var body: some View {
        VStack {
            Text("test5")
                .font(.title)
                .bold()
                .accessibilityIdentifier("welcomeText")
            Text("Please login to your account")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
