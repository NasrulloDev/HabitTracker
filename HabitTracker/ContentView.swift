//
//  ContentView.swift
//  HabitTracker
//
//  Created by Насрулло Исмоилжонов on 11/02/24.
//

import SwiftUI

struct Habit: Identifiable, Equatable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var completion: Int = 0
}

@Observable
class Habits {
    var items = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedHabits){
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @State private var habits = Habits()
    @State private var showAddHabit = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(habits.items){ item in
                    NavigationLink{
                        DetailView(habit: item, habits: habits)
                    } label: {
                        Text(item.title)
                    }
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
