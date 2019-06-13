import Foundation

/// Blocks are the body of a card's content
enum Block {
    case h(title: String)
    case p(body: String)
}

/// Content defines the whole content of a card
struct Content {
    let body: [Block]
    
    // TODO: load from JSON instead of here. Just hacks for now.
    
    static var test0: Content {
        return Content(body: [
            .h(title: "Header"),
            .p(body: """
Hong Kong’s stock market fell 1.7 percent on Wednesday in an otherwise quiet trading day in Asia, as protesters filled up a main transportation artery where multinational companies and international banks occupy much of the gleaming skyscraper real estate. The police used tear gas on protesters Wednesday afternoon on the same streets and sidewalks that bankers and lawyers for some of the world’s biggest companies travel on their daily commutes. Employees at major banks like HSBC and accounting firms like Deloitte were told to work from home in anticipation of grinding traffic and concerns about safety.
"""),
            ])
    }
}
