//
//  Test3.swift
//  Test
//
//  Created by ACI on 24/08/22. Updated by Aditya Cahyo on 24/06/22.
//

import SwiftUI

struct Test3: View {
    @StateObject private var viewModel = ViewModelTest3()
    
    var body: some View {
        Text(viewModel.status)
            .onAppear {
                viewModel.dummyUrlRequest()
            }
    }
}

struct Test3_Previews: PreviewProvider {
    static var previews: some View {
        Test3()
    }
}
