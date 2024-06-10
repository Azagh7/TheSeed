import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            NavigationLink{
                ContentView()
                    .navigationBarBackButtonHidden()
            }
        label:{
            Rectangle()
                .frame(width: 400, height: 200)
                .foregroundColor(.yellow)
                .overlay(Text("Play")
                    .font(.system(size: 54))
                    .bold()
                    .foregroundColor(.black))
        }
        }
    }
}

#Preview {
    StartView()
}
