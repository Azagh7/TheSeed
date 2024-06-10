import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let name: String
    let price: Int
}
