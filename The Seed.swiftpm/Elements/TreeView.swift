import SwiftUI

struct TreeView: View {
    @Binding var isTreeCut: Bool
    @Binding var showChainsaw: Bool
    @Binding var score: Int
    var body: some View {
        Image(isTreeCut ? "tree_cut" : "tree")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 500, height: 500)
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    }
}
