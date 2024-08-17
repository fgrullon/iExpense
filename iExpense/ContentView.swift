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
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View{
        
        Text("Second View")
        Text("Hello, \(name)")
        Button("Dismiss"){
            dismiss()
        }
        NavigationStack{
            VStack{
                List{
                    ForEach(numbers, id: \.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar{
                EditButton()
            }
        }

    }
    
    func removeRows(at offSets: IndexSet){
        numbers.remove(atOffsets : offSets)
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
