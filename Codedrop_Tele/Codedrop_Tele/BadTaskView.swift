
import SwiftUI

struct BadTaskView: View {

    let dummyTasks: [TaskBadData] = [
        TaskBadData(taskBadContent: "내가 어제 밤늦게까지 만든 자료가 날아갔어. 한번 써본 덕분에 이번에는 더 깔꼬롬하게 만들수 있잖아? 이거 완전 럭키비키잖아?😄😄😄😄", taskBadDate: Date()),
        TaskBadData(taskBadContent: "내가 어제 밤늦게까지 만든 자료가 날아갔어. 한번 써본 덕분에 이번에는 더 깔꼬롬하게 만들수 있잖아? 이거 완전 럭키비키잖아?😄😄😄😄", taskBadDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
        TaskBadData(taskBadContent: "내가 어제 밤늦게까지 만든 자료가 날아갔어. 한번 써본 덕분에 이번에는 더 깔꼬롬하게 만들수 있잖아? 이거 완전 럭키비키잖아?😄😄😄😄", taskBadDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
        TaskBadData(taskBadContent: "엄마에게 전화하여 잡담 및 주말 계획 논의", taskBadDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!),
        TaskBadData(taskBadContent: "프로젝트 마일스톤 및 마감일 논의", taskBadDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
        TaskBadData(taskBadContent: "책의 마지막 두 장 읽기", taskBadDate: Calendar.current.date(byAdding: .day, value: 5, to: Date())!),
        TaskBadData(taskBadContent: "여름 휴가 여행 계획 및 조사", taskBadDate: Calendar.current.date(byAdding: .day, value: 6, to: Date())!),
        TaskBadData(taskBadContent: "전기 및 수도 요금 지불", taskBadDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!)
    ]

    var body: some View {
        NavigationStack {
            HStack(spacing: 0) {
                Text("이거 완전 럭키비키잖아?")
                    .foregroundColor(.black)
                    .font(.system(size: 22, weight: .bold))
                
                Spacer()
            }

            ZStack {
                ScrollView {
                    ForEach(dummyTasks) { task in
                        NavigationLink(destination: DetailBadTaskView(task: task)) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("🍀" + task.taskBadDate.toFormattedString())
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .bold))
                                    .padding(.top, 16)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 6)

                                Text(task.taskBadContent )
                                    .foregroundColor(.black)
                                    .lineLimit(3)
                                    .frame(width: 321, height: 66, alignment: .leading)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 20)

                            }
                            .frame(height: 131)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 1)
                                    .stroke(Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.5), lineWidth: 2)

                            )
                            .padding(.vertical, 5)
                        }
                    }

                    Rectangle()
                        .frame(width: 393, height: 158)
                        .foregroundColor(.clear)
                }

                VStack(spacing: 0) {
                    Spacer()
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 393, height: 160)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: .white.opacity(0.3), location: 0.00),
                                        Gradient.Stop(color: .white, location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0),
                                    endPoint: UnitPoint(x: 0.5, y: 0.34)
                                )
                            )

                        Button(action: {

                        }, label: {
                            Text("오늘의 럭키비키 쓰러가기")
                                .font(.system(size: 17, weight: .regular))
                                .padding(.horizontal, 33)
                                .padding(.vertical, 16)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(30)

                        })
                        .padding(EdgeInsets(top: 65, leading: 77, bottom: 43, trailing: 77))
                    }
                }
            }
        }
        .padding(16)
    }
}

#Preview {
    BadTaskView()
}

