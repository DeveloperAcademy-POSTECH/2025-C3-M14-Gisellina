struct HintSheetView: View {
    var body : some View {
        VStack {
            VStack {
                Text("Hint")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
              }
            
            Text("Hint")
        }
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(Color.black.opacity(0.5))
    }
}