//
//  ContentView.swift
//  iExpense
//
//  Created by Frank Grullon on 17/8/24.
//

import SwiftUI

struct SecondView: View {
    var body: some View{
        Text("Second View")
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        VStack {
            Button("Show Sheet"){
                showingSheet.toggle()
            }
        }
        .sheet(isPresented: $showingSheet){
            SecondView()
        }
    }
}

#Preview {
    ContentView()
}
