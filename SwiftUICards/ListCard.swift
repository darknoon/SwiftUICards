import SwiftUI

struct ListCardTitle : View {
    
    enum CardSize {
        case small
        case large
    }
    
    let cardSize: CardSize = .large

    let title: String

    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .lastTextBaseline) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .color(.white)
                    .padding()
                    .opacity(0.7)
                    .blendMode(.plusLighter)
                Spacer()
            }
        }
    }
}

let images: [String] = (0..<5).map{i in "niice_v\(i + 1)" }

struct ListCard : View {
    
    let i: Int = 0
    let title = "Section Name"
    
    var body: some View {
        SectionHeading(title: title, image: images[i % images.count])
        .cornerRadius(10)
    }
}

struct SectionHeading : View {
    
    let title: String
    let image: String
    
    var body: some View {
        ZStack {
            ListCardTitle(title: title)
                .background(
                    Image(image)
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
            )
            }
            .relativeWidth(1.0)
    }
}

struct FullPage : View {
    
    let title: String
    let image: String
    let content: Content
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            SectionHeading(title: title, image: image)
                .frame(height: 200.0)
                .cornerRadius(0)
            
            
            CardContentView(content: content)

            Spacer()
            
            }
            .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ListCard_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ListCard()
                .padding()
                .previewLayout(.fixed(width: 300, height: 300))
            
            FullPage(
                title: "My title",
                image: images[2],
                content: Content.test0)
        }
    }
}
#endif

struct ContentView : View {
    
    var body: some View {
        return Text("oeuoeu")
            .lineLimit(nil)
            .padding(.all)
    }
}
