//
//  DetailBadTaskView.swift
//  Codedrop_Tele
//
//  Created by hanseoyoung on 6/15/24.
//

import SwiftUI

struct DetailBadTaskView: View {
//    let task: TaskBadData = TaskBadData(taskBadContent: "해커톤 하느라 밤을 새야 한다는게 피곤하긴 하지만, 덕분에 새로운 아이디어를 떠올리고 팀원들과 밤샘 작업의 추억을 만들 수 있잖아! 만약 밤을 새지 않았으면 이런 특별한 경험을 하지 못했을 거야.\n그리고 밤샘 작업 후에 마시는 커피는 그 어느 때보다 꿀맛이지! 그래서 지금 상황이 최고야. 완전 럭키비키잖아!", taskBadDate: Date())
    let task: TaskBadData
    var body: some View {
        ZStack {
            Image("LuckyLine")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(spacing: 0) {
                Text(task.taskBadDate.toFormattedString() + "의 럭키비키")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top, 68)

                ScrollView {
                    Text(task.taskBadContent)
                        .font(.system(size: 20, weight: .regular))
                }
                .frame(width: 259, height: 300)
                .padding(EdgeInsets(top: 36, leading: 52, bottom: 91, trailing: 51))
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 83)
        .padding(.bottom, 108)
    }
}

#Preview {
    DetailBadTaskView(task: .init(taskBadContent: "", taskBadDate: Date()))
}
