import SwiftUI

struct ScoreView: View {
    @Binding var score: Int
    var body: some View {
        HStack {
            Image(systemName: "dollarsign")
                .font(.system(size: 60))
            Text("\(score)")
                .font(.system(size: 50))
        }
        .foregroundColor(.yellow)
    }
}
