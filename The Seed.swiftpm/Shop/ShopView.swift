import SwiftUI

struct ShopView: View {
    @Environment(\.dismiss) var dismiss
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Binding var score: Int
    @State var showError: Bool = false
    @Binding var productsBoughtCount: Int
    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    dismiss()
                }
                .font(.title)
                .padding()
                HStack{
                    Text("\(score)")
                    Image(systemName: "dollarsign")
                }
            }
            LazyVGrid(columns: columns, spacing: 40) {
                ForEach(products) { product in
                    ProductCard(product: product, score: $score, showError: $showError, productsBoughtCount: $productsBoughtCount, isPurchased: false)
                }
            }
            .padding()
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Error"), message: Text("Not enough money"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ProductCard: View {
    let product: Product
    @Binding var score: Int
    @Binding var showError: Bool
    @Binding var productsBoughtCount: Int
    @State private var isPurchased: Bool
    init(product: Product, score: Binding<Int>, showError: Binding<Bool>, productsBoughtCount: Binding<Int>, isPurchased: Bool) {
        self.product = product
        self._score = score
        self._showError = showError
        self._productsBoughtCount = productsBoughtCount
        self._isPurchased = State(initialValue: isPurchased)
    }
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    if !isPurchased && product.price <= score {
                        score -= product.price
                        isPurchased = true
                        saveIsPurchasedState()
                        productsBoughtCount += 1
                    } else if !isPurchased {
                        showError = true
                    }
                }
            Text(product.name)
                .font(.headline)
                .padding(.top, 5)
            HStack{
                Text("\(product.price)")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding(.top, 1)
                Image(systemName: "dollarsign")
            }
        }
        .padding()
        .background(isPurchased ? Color.green : Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .onAppear {
            loadIsPurchasedState()
        }
    }
    private func saveIsPurchasedState() {
        UserDefaults.standard.set(isPurchased, forKey: "isPurchased\(product.id)")
    }
    
    private func loadIsPurchasedState() {
        isPurchased = UserDefaults.standard.bool(forKey: "isPurchased\(product.id)")
    }
}
