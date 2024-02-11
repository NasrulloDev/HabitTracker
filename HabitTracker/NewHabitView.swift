//
//  NewHabitView.swift
//  HabitTracker
//
//  Created by Насрулло Исмоилжонов on 11/02/24.
//

import SwiftUI

struct NewHabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    var habits: Habits
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new habit")
            .toolbar{
                Button("Save"){
                    let item = Habit(title: title, description: description)
                    habits.items.append(item)
                    dismiss()
                }
            }
            
        }
    }
}

#Preview {
    NewHabitView(habits: Habits())
}
