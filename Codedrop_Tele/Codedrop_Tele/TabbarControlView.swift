import SwiftUI

struct TabbarControlView: View {
    var body: some View {
        TabView {
            GoodTaskView()
                .tabItem {
                    Label("Good", systemImage: "house")
                }
            BadTaskView()
                .tabItem {
                    Label("Bad", systemImage: "house")
                }
        }
    }
}

#Preview {
    TabbarControlView()
}
