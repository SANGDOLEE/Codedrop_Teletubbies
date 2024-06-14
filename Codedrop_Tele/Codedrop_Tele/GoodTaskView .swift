import SwiftUI
import SwiftData

struct GoodTaskView: View {
    
    @State private var progress: Double = 1.0 // 현재 프로그레스바 Value
    @State private var maxProgess: Double = 2.0 // 언락까지 프로그레스바 Total Value
    @State private var showModal = false // 모달 표시 여부
    
    @Environment(\.modelContext) var modelContext
    @Query var goodTasks: [TaskGoodData]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    HStack{
                        Text("곧 잠금이 풀려요!")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .padding(.leading)
                            .padding(.top)
                        
                        Spacer()
                    }
                    HStack{
                        Text("1개만 더 작성해주세요!")
                            .font(.system(size: 24))
                            .padding(.leading)
                            .padding(.top, 2)
                        
                        Spacer()
                    }
                    
                    CustomProgressView(currentProgress: $progress, maxProgess: $maxProgess)
                    
                    ScrollView{
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(1...4, id: \.self) { index in
                                GridItemView(index: index)
                            }
                        }
                        .padding()
                    }
                    Spacer()
                }
                
                // 플로팅 버튼
                VStack {
                    Spacer()
                    Button(action: {
                        showModal.toggle()
                        print("Tapped : 긍정이야기 쓰러가기")
                    }) {
                        HStack {
                            Text("긍정이야기 쓰러가기")
                                .font(.system(size: 18))
                                .fontWeight(.heavy)
                                .padding(.leading, 20)
                                .foregroundColor(.white)
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(8)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 20)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(30)
                        .shadow(radius: 10)
                    }
                    .sheet(isPresented: self.$showModal) {
                        ModalView()
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                
            }
            // .navigationTitle("좋은 기억") // 네비게이션 제목 추가
        }
    }
}

// MARK: Task 작성 모달
struct ModalView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @Environment(\.modelContext) var modelContext
    
    @State private var title: String = ""
    @State private var content: String = ""
    var today = Date()
    
    var body: some View {
        
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all) // Gray background
            
            NavigationView {
                VStack {
                    HStack {
                        Text("긍정적 작성")
                        Spacer()
                    }
                    
                    HStack{
                        Text("제목")
                            .padding()
                        
                        TextField("제목을 입력해주세요.", text: $title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing)
                    }
                    
                    TextEditor(text: $content)
                        .frame(height: 200)
                        .padding()
                        .border(Color.gray, width: 1)
                        .cornerRadius(8)
                    
                    HStack {
                        Button(action: {
                            // 저장 액션 등 필요한 로직 구현
                            presentation.wrappedValue.dismiss()
                        }) {
                            Text("작성완료")
                                .font(.system(size: 18))
                                .fontWeight(.heavy)
                                .padding(.leading, 20)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(trailing:
                                        Button(action: {
                    presentation.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                })
                //.navigationBarTitle("긍정적 작성", displayMode: .inline)
            }
        }
    }
}


// MARK: 리스트 Cell View
struct GridItemView: View {
    
    let index: Int
    
    //let goodTasks: TaskGoodData
    
    var body: some View {
        VStack {
            HStack{
                dateBadge()
                Spacer()
            }
            
            HStack{
                titleBadge()
                Spacer()
            }
            
            HStack{
                contentBadge()
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                emojiBadge()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 180)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
    }
    
    // 날짜
    func dateBadge() -> some View {
        
        return ZStack {
            Rectangle()
                .frame(width: 100, height: 22)
                .foregroundColor(.yellow)
                .cornerRadius(10)
            
            Text("2024.05.01")
                .multilineTextAlignment(.center)
                .frame(height: 22, alignment: .center)
        }
    }
    
    // 제목
    func titleBadge() -> some View {
        
        return ZStack {
            
            Text("여기는 제목이여")
                .multilineTextAlignment(.center)
                .bold()
                .frame(height: 22, alignment: .center)
        }
    }
    
    // 내용
    func contentBadge() -> some View {
        
        return ZStack {
            
            Text("여기는 내용입니다.")
                .multilineTextAlignment(.center)
                .frame(height: 22, alignment: .center)
        }
    }
    
    // 축하뱃지
    func emojiBadge() -> some View {
        
        return ZStack {
            
            Text("🎉")
                .font(.system(size:60))
                .multilineTextAlignment(.center)
                .frame(height: 22, alignment: .center)
                .padding(.bottom)
        }
    }
    
}

// MARK: 프로그레스 바
struct CustomProgressView: View {
    
    @Binding var currentProgress: Double
    @Binding var maxProgess: Double
    
    var body: some View {
        VStack{
            ProgressView(value: currentProgress, total: maxProgess)
                .scaleEffect(CGSize(width: 1.0, height: 3.0))
                .padding()
        }
    }
}

#Preview {
    GoodTaskView()
}
