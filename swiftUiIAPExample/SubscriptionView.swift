//
//  SubscriptionView.swift
//  swiftUiIAPExample
//
//  Created by Eren Kara on 28.04.2023.
//

import SwiftUI
import StoreKit

struct SubscriptionView: View {
    @EnvironmentObject var storeVM : StoreVM
    @State var isPurchased = false
    
    var body: some View {
        Group {
            Section("Upgrade to Premium") {
                ForEach(storeVM.subscriptions) { product in
                    Button(action: {
                        Task {
                            await buy(product: product)
                        }
                    }) {
                        VStack {
                            HStack {
                                Text(product.displayPrice)
                                Text(product.displayName)
                            }
                            Text(product.description)
                        }.padding()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15.0)

                }
            }
        }
    }
    
    func buy(product: Product) async {
        do {
            if try await storeVM.purchase(product) != nil {
                isPurchased = true
            }
        } catch {
            print("purchase failed")
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
            .environmentObject(StoreVM())
    }
}
