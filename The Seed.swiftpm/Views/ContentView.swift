import SwiftUI

struct ContentView: View {
    @State private var isTreeCut: Bool = false
    @State private var showChainsaw: Bool = false
    @State private var score: Int = 0
    @State private var dropValue: Int = 0
    @State private var showingShop = false
    @State private var tapLocation: CGPoint = .zero
    @State var productsBoughtCount: Int = 0
    var body: some View {
        if dropValue > 50 {
            FinalView()
        } 
        else if productsBoughtCount > 11 {
            WinView()
        }
        else {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .overlay(
                        HStack {
                            Spacer()
                            ScoreView(score: $score)
                                .frame(maxWidth: 400)
                            Spacer()
                            Button("Shop") {
                                showingShop.toggle()
                            }
                            .foregroundColor(.black)
                            .sheet(isPresented: $showingShop) {
                                ShopView(score: $score, productsBoughtCount: $productsBoughtCount)
                            }
                            .frame(maxWidth: 100)
                            .frame(height: 70)
                            .font(.headline)
                            
                            .background(.yellow)
                            Spacer()
                            DropView(value: $dropValue)
                                .frame(maxWidth: 350)
                            Spacer()
                        }
                            .padding(.top, 50),
                        alignment: .top
                    )
                TreeView(isTreeCut: $isTreeCut, showChainsaw: $showChainsaw, score: $score)
                    .onTapGesture { location in
                        tapLocation = location
                        isTreeCut.toggle()
                        showChainsaw = true
                        let randomIncrement = Int.random(in: 172000...280000)
                        score += randomIncrement
                        dropValue += 1
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isTreeCut.toggle()
                            showChainsaw = false
                        }
                    }
                if showChainsaw {
                    ChainsawView(position: tapLocation)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

