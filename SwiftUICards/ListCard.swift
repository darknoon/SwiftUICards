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

let images: [String] = (0..<5).map{i in "niice_v\(i)" }

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

struct FullPage : View {
    
    let title: String
    let image: String
    let bodyText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeading(title: title, image: image)
                .frame(height: 200.0)
                .cornerRadius(0)
            
            Text(bodyText)
                .lineLimit(nil)
                .padding(.all)

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
                bodyText: "You may not like it, but this is the greatest body in the world.")
        }
    }
}
#endif
