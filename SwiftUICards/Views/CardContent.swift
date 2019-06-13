import SwiftUI


/// Allow Blocks to be used in an identifiable context
extension Block : Identifiable {
    var id: String {
        switch self {
        case let .h(title): return title
        case let .p(body): return body
        }
    }
}

struct ParagraphView : View {
    let text: String
    var body: some View {
        Text(text)
            .lineLimit(nil)
    }
}

struct HeadingView : View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title)
            .padding(.top)
    }
}

extension Block : View {
    var body: AnyView {
        switch self {
        case let .h(title):
            return
                HeadingView(title: title)
                    .erased()
        case let .p(body):
            return
                ParagraphView(text: body)
                    .erased()
        }
    }
}

struct CardContentView : View {
    let content: Content
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(content.body) {item -> AnyView in
                switch item {
                case let .h(title):
                    return
                        HeadingView(title: title)
                            .erased()
                case let .p(body):
                    return
                        ParagraphView(text: body)
                            .erased()
                }
            }
        }
        .padding([.leading, .bottom, .trailing])
    }
}

#if DEBUG
struct Content_Previews : PreviewProvider {
    
    static var previews: some View {
        CardContentView(content: .test0)
            .previewLayout(
                .sizeThatFits)

    }
}
#endif
