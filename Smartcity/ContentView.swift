import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("RadarGoat 🐐")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("L'application qui ressence tout les radars de France.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                NavigationLink(destination: Stp()) {
                    Text("Entrer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.black)
                        .cornerRadius(12)}}
            .frame(maxWidth: .infinity, maxHeight: .infinity)}}}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()}}



