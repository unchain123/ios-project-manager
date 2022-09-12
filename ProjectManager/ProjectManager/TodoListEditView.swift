//
//  TodoListEditView.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/12.
//

import SwiftUI

struct TodoListEditView: View {
    var body: some View {
        VStack {
            TodoListEditTitleView()
            TodoListEditTitleTextView()
            TodoListEditDatePickerView()
        }
    }
}

struct TodoListEditTitleView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }, label: {
                Text("Edit")
                    .font(.title3)
            })
            .padding(10)
            Spacer()
            Text("Project Manager")
                .font(.title)
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
                Text("Done")
                    .font(.title3)
                    .padding(10)
            })
        }
    }
}

struct TodoListEditTitleTextView: View {
    @State var title: String = ""

    var body: some View {
        TextField("Title", text: $title)
            .padding()
            .background(Color(.systemBackground))
            .shadow(color: .gray, radius: 5, x: 10, y: 10)
            .padding(12)
    }
}

struct TodoListEditDatePickerView: View {
    @State var date = Date()

    var body: some View {
        DatePicker("",
                   selection: $date,
                   displayedComponents: .date)
        .datePickerStyle(WheelDatePickerStyle())
        .labelsHidden()
    }
}

struct TodoListEditView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListAddView()
    }
}
