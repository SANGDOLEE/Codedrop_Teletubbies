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
                        .frame(height: 30)
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
            .navigationTitle("좋은 기억") // 네비게이션 제목 추가
        }
    }
}

// MARK: Task 작성 뷰
struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Modal view 등장")
            Button(action: {
                presentation.wrappedValue.dismiss()
            }) {
                Text("Modal view 닫기").bold()
            }
            .frame(width: 150, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 40)) // 이 부분의 괄호를 추가해야 합니다.
            .font(.system(size: 16))
            .foregroundColor(Color.white)
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
