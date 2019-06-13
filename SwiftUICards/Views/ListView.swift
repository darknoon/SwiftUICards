import SwiftUI

struct ListView : View {
    var body: some View {
        NavigationView {
			GeometryReader { geo in
				ScrollView {
					ForEach(0 ..< 5) { item in
						ListCard(title: "Card \(item)")
							.padding([.bottom, .leading, .trailing])
							.frame(width: geo.size.width, height: geo.size.width * 1.333)
							.shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.33), radius: 20, x: 0, y: 10)
						
					}
				}
				.navigationBarTitle(Text("Too many cards!"))
			}
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
