import SwiftUI

struct FinalView: View {
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
                    .overlay(Text("When the last tree has fallen and the rivers\n are poisoned, you cannot eat money.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white))
                
                Spacer()
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden()) {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 200, height: 100)
                        .overlay(Text("Play again")
                            .font(.system(size: 30)))
                        .foregroundColor(.black)
                }
                .padding(50)
            }
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
