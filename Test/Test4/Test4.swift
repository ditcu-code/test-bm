//
//  Test4.swift
//  Test
//
//  Created by ACI on 29/08/22.
//

import SwiftUI

struct Test4: View {
    @State private var goToDetailTest4 = false
    @State private var total = 0
    
    private let value1 = 20
    private let value2 = 30
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Button {
                    total = value1 + value2 // Menghitung penjumlahan value1 dan value2
                    goToDetailTest4 = true
                } label: {
                    Text("Add value1 and value2 to total")
                }
                
                Text("\(total)")
                
                NavigationLink(destination: DetailTest4(total: $total), isActive: $goToDetailTest4) {
                    EmptyView()
                }
            }
        }.navigationViewStyle(.stack)
    }
}

struct DetailTest4: View {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var total: Int // Menggunakan Binding untuk memperbarui nilai total
    
    private let value3 = 50
    
    var body: some View {
        ZStack {
            Button {
                total += value3 // Menambahkan value3 ke total
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Add value3 to total")
            }
        }
        .navigationBarHidden(true)
    }
}

struct Test4_Previews: PreviewProvider {
    static var previews: some View {
        Test4()
    }
}
