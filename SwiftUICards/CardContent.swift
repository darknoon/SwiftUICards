//
//  Content.swift
//  SwiftUICards
//
//  Created by Andrew Pouliot on 6/12/19.
//  Copyright © 2019 Andrew Pouliot. All rights reserved.
//

import SwiftUI

enum Block {
    case h(title: String)
    case p(body: String)
}

extension Block : Identifiable {
    var id: String {
        switch self {
        case let .h(title): return title
        case let .p(body): return body
        }
    }
}

struct Content {
    let body: [Block]
    
    static var test0: Content {
        return Content(body: [
            .h(title: "Header"),
            .p(body: """
Hong Kong’s stock market fell 1.7 percent on Wednesday in an otherwise quiet trading day in Asia, as protesters filled up a main transportation artery where multinational companies and international banks occupy much of the gleaming skyscraper real estate. The police used tear gas on protesters Wednesday afternoon on the same streets and sidewalks that bankers and lawyers for some of the world’s biggest companies travel on their daily commutes. Employees at major banks like HSBC and accounting firms like Deloitte were told to work from home in anticipation of grinding traffic and concerns about safety.
"""),
            ])
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

extension View {
    func erased() -> AnyView {
        return AnyView(self)
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
