import Foundation
import CoreLocation

struct Radar: Identifiable {
    let id = UUID()
    let lat: Double
    let lon: Double
    let speed: Int
}

class RadarService: ObservableObject {
    @Published var radars: [Radar] = []
    
    func getRadars() {
        URLSession.shared.dataTask(with: URL(string: "https://www.data.gouv.fr/api/1/datasets/r/402aa4fe-86a9-4dcd-af88-23753e290a58")!) { data, _, _ in
            let csv = String(data: data!, encoding: .utf8)!
            let lines = csv.components(separatedBy: .newlines)
            
            for line in lines.dropFirst() {
                let parts = line.components(separatedBy: ";")
                if parts.count >= 6 {
                    self.radars.append(Radar(
                        lat: Double(parts[3]) ?? 0,
                        lon: Double(parts[4]) ?? 0,
                        speed: Int(parts[5]) ?? 0
                    ))
                }
            }
        }.resume()
    }
}
