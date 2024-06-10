import SwiftUI

struct ChainsawView: View {
    let position: CGPoint
    var body: some View {
        Image("chainsaw")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .position(position)
    }
}
