import SwiftUI

struct GoodTaskView: View {
    
    @State private var progress: Double = 1.0 // 프로그레스바 변수
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CustomProgressView(progress: $progress)
                    
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
                        // 버튼 액션
                        print("Floating Button Tapped")
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
                    .padding()
                }
                .frame(maxWidth: .infinity)
                
            }
            .navigationTitle("좋은 기억") // 네비게이션 제목 추가
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
    @Binding var progress: Double
    
    
    var body: some View {
        VStack{
            ProgressView(value: progress, total: 2.0)
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
