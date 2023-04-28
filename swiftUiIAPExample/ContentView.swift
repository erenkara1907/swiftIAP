//
//  ContentView.swift
//  swiftUiIAPExample
//
//  Created by Eren Kara on 28.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var storeVM = StoreVM()
    
    var body: some View {
        VStack {
            if storeVM.purchaseSubscriptions.isEmpty {
                SubscriptionView()
            } else {
                Text("Premium Content")
            }
        }
        .padding()
        .environmentObject(storeVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
