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
<<<<<<< HEAD
    
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
=======
    @Published var isLoading = false
    
    private let apiURL = "https://www.data.gouv.fr/api/1/datasets/r/402aa4fe-86a9-4dcd-af88-23753e290a58"
    
    init() {
        loadRadars()
    }
    
    func loadRadars() {
        isLoading = true
        
        URLSession.shared.dataTask(with: URL(string: apiURL)!) { data, _, _ in
            guard let data = data,
                  let csv = String(data: data, encoding: .utf8) ?? String(data: data, encoding: .isoLatin1) else {
                DispatchQueue.main.async { self.isLoading = false }
                return
            }
            
            let radars = self.parseCSV(csv)
            
            DispatchQueue.main.async {
                self.radars = radars
                self.isLoading = false
            }
        }.resume()
    }
    
    private func parseCSV(_ csv: String) -> [Radar] {
        return csv.components(separatedBy: .newlines)
            .dropFirst() 
            .compactMap { line in
                let parts = line.components(separatedBy: ";")
                guard parts.count >= 6,
                      let lat = Double(parts[3]),
                      let lon = Double(parts[4]),
                      let speed = Int(parts[5]),
                      lat != 0, lon != 0, speed != 0 else { return nil }
                return Radar(lat: lat, lon: lon, speed: speed)
            }
    }
} 
>>>>>>> origin/arthur
