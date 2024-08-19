//
//  ContentView.swift
//  iExpense
//
//  Created by Frank Grullon on 17/8/24.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    

    var body: some View{
        NavigationStack{
                List{
                    ForEach(expenses.items, id: \.name){ item in
                        Text(item.name)
                    }
                    .onDelete(perform: removeRows)
                }
                
                .navigationTitle("iExpense")
                .toolbar{
                    Button("Add Expense", systemImage: "plus"){
                        let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                        
                        expenses.items.append(expense)
                    }
                }
        }

    }
    
    func removeRows(at offSets: IndexSet){
        expenses.items.remove(atOffsets : offSets)
    }

}

#Preview {
    ContentView()
}
