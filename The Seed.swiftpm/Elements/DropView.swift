import SwiftUI

struct DropView: View {
    @Binding var value: Int
    @State var opacity: Double = 0.9
    var body: some View {
        ZStack {
            Image(systemName: "drop.fill")
                .font(.system(size: 70))
                .foregroundColor(.blue)
                .opacity(opacity)
                .frame(width: 50, height: 50)
        }
        .onChange(of: value){
            if value > 45 {
                opacity = 0.1
            }
            else if value > 40{
                opacity = 0.2
            }
            else if value > 35{
                opacity = 0.3
            }
            else if value > 30{
                opacity = 0.4
            }
            else if value > 25{
                opacity = 0.5
            }
            else if value > 20{
                opacity = 0.6
            }
            else if value > 15{
                opacity = 0.7
            }
            else if value > 10{
                opacity = 0.8
            }
            else if value > 5{
                opacity = 0.9
            }
        }
    }
}
