import SwiftUI
import SwiftData

struct GoodTaskView: View {
    
    @State private var progress: Double = 1.0 // 현재 프로그레스바 Value
    @State private var maxProgess: Double = 2.0 // 언락까지 프로그레스바 Total Value
    @State private var showModal = false // 모달 표시 여부
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
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
                            .background(.gray)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                
            }
            .navigationTitle("좋은 기억") // 네비게이션 제목 추가
        }
    }
}

// MARK: Task 작성 뷰
struct ModalView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var title: String = ""
    @State private var content: String = ""
    
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
                        .border(Color.gray, width: 3)
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
    
    var body: some View {
        VStack {
            Text("Item \(index)")
                .frame(maxWidth: .infinity, minHeight: 160)
                .background(Color.blue)
                .cornerRadius(10)
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
                .padding(.top)
                .padding(.horizontal)
            
            HStack{
                Text("잠금해제까지 1개만더..!") // 변수로 넣어야함
                    .padding()
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    GoodTaskView()
}
