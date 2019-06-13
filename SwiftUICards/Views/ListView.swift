import SwiftUI

struct ListView : View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0 ..< 5) { item in
                    ListCard(title: "Card \(item)")
                        .relativeWidth(1.0)
                        .padding([.bottom, .leading, .trailing])
                }
                }
                .navigationBarTitle(Text("Too many cards!"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
#endif
