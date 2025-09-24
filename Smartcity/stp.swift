//
//  stp.swift
//  Smartcity
//
//  Created by Quentin 🕺🏽 on 24/09/2025.
//


import SwiftUI
import MapKit

struct Stp: View {
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334),
            span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
        )
    )
    
    var body: some View {
        VStack {
            Map(position: $cameraPosition) {}
            .ignoresSafeArea()
            
        }
    }
}

struct Stp_Previews: PreviewProvider {
    static var previews: some View {
        Stp()
    }
}



