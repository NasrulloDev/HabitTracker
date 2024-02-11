//
//  ContentView.swift
//  HabitTracker
//
//  Created by Насрулло Исмоилжонов on 11/02/24.
//

import SwiftUI

struct Habit: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

@Observable
class Habits {
    var items = [Habit]()
}

struct ContentView: View {
    @State private var habits = Habits()
    @State private var showAddHabit = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(habits.items){ item in
                    Text(item.title)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habits")
            .toolbar{
                Button("Add new habit", systemImage: "plus"){
                    showAddHabit = true
                }
            }
            .sheet(isPresented: $showAddHabit){
                NewHabitView(habits: habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        habits.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
