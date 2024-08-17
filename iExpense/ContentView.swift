//
//  ContentView.swift
//  iExpense
//
//  Created by Frank Grullon on 17/8/24.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View{
        Text("Second View")
        Text("Hello, \(name)")
        Button("Dismiss"){
            dismiss()
        }
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
            SecondView(name: "Frank")
        }
    }
}

#Preview {
    ContentView()
}
