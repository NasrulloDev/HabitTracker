//
//  DetailView.swift
//  HabitTracker
//
//  Created by Насрулло Исмоилжонов on 13/02/24.
//

import SwiftUI

struct DetailView: View {
    var habit: Habit
    var habits: Habits
    
    var body: some View {
        
        Text(habit.description)
        Text(String(habit.completion))
        Button("Add"){
            var newHabit = habit
            newHabit.completion += 1
            let index = habits.items.firstIndex(of: habit)
            habits.items[index!] = newHabit
        }
        
    }
}

#Preview {
    DetailView(habit: Habit(title: "Pray", description: "Pray 5 times a day"), habits: Habits())
}
