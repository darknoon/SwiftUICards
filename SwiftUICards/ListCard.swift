import SwiftUI

struct ListCardTitle : View {

    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .color(.white)
                .alignmentGuide(.lastTextBaseline, computeValue: { _ in 0.0 })
        }
    }
}

let images: [String] = (0..<5).map{i in "nice_v\(i)" }

struct ListCard : View {
    
    let i: Int = 0
    let title = "Section Name"
    
    var body: some View {
        SectionHeading(title: title, image: images[(i % images.count) + 1])
        .cornerRadius(10)
    }
}

struct SectionHeading : View {
    
    let title: String
    let image: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
            ListCardTitle(title: title)
        }
    }
}





#if DEBUG
struct ListCard_Previews : PreviewProvider {
    static var previews: some View {
        ListCard()
            .padding()
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
#endif
