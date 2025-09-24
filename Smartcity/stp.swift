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
    
    var body: some View {
        Map {
            ForEach(service.radars) { radar in
                Annotation("\(radar.speed)", coordinate: CLLocationCoordinate2D(latitude: radar.lat, longitude: radar.lon)) {
                    Text("🚨")
                        .font(.title)
                }
            }
        }
        .onAppear {
            service.getRadars()
        }
    }
}

struct Stp_Previews: PreviewProvider {
    static var previews: some View {
        Stp()
    }
}



