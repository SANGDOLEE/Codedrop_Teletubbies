//
//  BadTaskWriteModalView.swift
//  Codedrop_Tele
//
//  Created by hanseoyoung on 6/15/24.
//

import SwiftUI
import SwiftData

struct BadTaskWriteModalView: View {

    @Environment(\.modelContext) var modelContext

    @Binding var showModal: Bool

    @State private var content: String = ""

    var todayDate = Date()

    var body: some View {
        VStack {
            HStack {
                Text("오늘 일하면서 \n힘들었던 일이 있나요?")
                    .font(.system(size: 28))
                    .padding(.horizontal, 18)
                    .padding(.top, 74)
                    .padding(.bottom, 20)
                Spacer()
            }

            ZStack(alignment: .topLeading) {
                TextEditor(text: $content)
                    .frame(height: 200)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )

                if content.isEmpty {
                    Text("내용을 입력해주세요.")
                        .foregroundColor(.gray)
                        .padding(.top, 23)
                        .padding(.leading, 20)
                }
            }


            HStack {
                Button(action: {
                    saveData()
                    showModal = false

                }) {
                    Text("작성완료")
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 14)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                }
            }
            .padding(.all, 20)
            .shadow(radius: 10)

            Spacer()
        }
        .padding()
    }

    private func saveData() {
        let newTask = TaskBadData(taskBadContent: content, taskBadDate: todayDate)
        modelContext.insert(newTask)

        do {
            try modelContext.save()
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }

}
