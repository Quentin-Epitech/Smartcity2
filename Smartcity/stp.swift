//
//  stp.swift
//  Smartcity
//
//  Created by Quentin 🕺🏽 on 24/09/2025.
//

import SwiftUI
import MapKit

struct Stp: View {
    @StateObject private var service = RadarService()
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334),
            span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
        )
    )
    
    var body: some View {
        VStack {
            HStack {
                Text("Radars: \(service.radars.count)")
                    .font(.headline)
                
                Spacer()
                
                Button("Actualiser") {
                    service.loadRadars()
                }
                .buttonStyle(.bordered)
                .disabled(service.isLoading)
            }
            .padding()
            
            Map(position: $cameraPosition) {
                ForEach(service.radars) { radar in
                    Annotation("\(radar.speed) km/h", coordinate: CLLocationCoordinate2D(latitude: radar.lat, longitude: radar.lon)) {
                        VStack {
                            Text("👮🏻‍♀️")
                                .font(.caption)
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
        .onAppear {
        }
    }
}

struct Stp_Previews: PreviewProvider {
    static var previews: some View {
        Stp()
    }
}



