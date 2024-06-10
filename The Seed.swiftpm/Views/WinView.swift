import SwiftUI

struct WinView: View {
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack{
                Spacer()
                Rectangle()
                    .frame(width: 700, height: 150)
                    .opacity(0.2)
                    .overlay(Text("You bought everything possible.\n Now, what are you going to do?.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white))
                Spacer()
                Button(action: {
                    exit(0)
                }) {
                    Text("Exit")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(50)
            }
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
