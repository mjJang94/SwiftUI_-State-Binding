//
//  ContentView.swift
//  SwiftUI_@State@Binding
//
//  Created by Paymint on 2020/05/27.
//  Copyright © 2020 Paymint. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var user: User
    @State private var isFavorite = true
    
    var body: some View {
        
        VStack(spacing: 30){
            
            Toggle(isOn: $isFavorite){
                Text("isFavorite : \(isFavorite.description)")
            }
            CountStepper()
            
            Text(user.name)
            Button(action: {
                self.user.score += 1
            }){
                Text(user.score.description)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(user: User())
    }
}

struct CountStepper: View {
    
    @State private var count = 0
    
    var body: some View {
        Stepper("Count: \(count)", value: $count)
    }
}

