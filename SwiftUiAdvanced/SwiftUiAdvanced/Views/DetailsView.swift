//
//  DetailsView.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/17/25.
//

import MapKit
import SwiftUI

struct DetailsView: View {
    @Binding
    var fixerUpper: FixerUpper
    @State private var showMoreDetails = true
    @State private var showEditModal = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                headerView

                Button {
                    showMoreDetails.toggle()
                } label: {
                    Text("\(showMoreDetails ? "Hide" : "Show more") details")
                }

                if showMoreDetails {
                    VStack(alignment: .leading, spacing: 16) {
                        mapView
                        renovationDetailsView
                        investmentDetailsView
                        environmentDetailsView
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $showEditModal) {
            EditView(fixerUpper: self.$fixerUpper)
        }
    }

    /**
     Very interesting how Views are declared separately instead of being part of the main body..
     */
    private var headerView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(fixerUpper.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button {
                    showEditModal = true
                } label: {
                    Image(systemName: "pencil.circle").font(.title)
                }
            }

            ZStack(alignment: .topLeading) {
                fixerUpper.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                if fixerUpper.isFavorite {
                    Circle()
                        .fill(.regularMaterial)
                        .overlay(
                            Image(systemName: "star.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.yellow)
                        )
                        .overlay {
                            Circle()
                                .strokeBorder(
                                    LinearGradient(colors: [.secondary, .primary], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.3))
                        }
                        .frame(maxWidth: 75)
                        .alignmentGuide(.leading) {
                            d in d[.leading] - 10
                        }
                        .alignmentGuide(.top) {
                            d in d[.top] - 10
                        }
                } else {
                    EmptyView()
                }

            }

            Text("\(fixerUpper.city), \(fixerUpper.state)")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("Asking Price: $\(fixerUpper.askingPrice, specifier: "%.2f")")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            if let plannedVisitDate = fixerUpper.plannedVisitDate {
                Label {
                    Text("Visit planned for \(plannedVisitDate.formatted(date: .abbreviated, time: .omitted))")
                } icon: {
                    Image(systemName: "calendar")
                }

            } else {
                Label {
                    Text("No visit planned")
                } icon: {
                    Image(systemName: "calendar.badge.exclamationmark")
                }
            }
        }
    }

    var rect: MKMapRect {
        MKMapRect(
            origin: MKMapPoint(fixerUpper.locationCoordinate),
            size: MKMapSize(width: 1, height: 1))
    }

    private var mapView: some View {

        VStack(alignment: .leading) {
            Text("Location")
                .font(.headline)

            Map(bounds: MapCameraBounds(centerCoordinateBounds: rect, minimumDistance: 3000)) {
                Marker("Property Location", coordinate: fixerUpper.locationCoordinate)
            }
            .mapStyle(.hybrid)
            .frame(height: 500)
            .cornerRadius(10)
        }
    }

    private var renovationDetailsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Renovation Details")
                .font(.headline)
                .padding(.bottom, 4)

            Text("Renovation Cost: $\(fixerUpper.renovationCost, specifier: "%.2f")")
            Text("Potential Value After Renovation: $\(fixerUpper.potentialValueAfterRenovation, specifier: "%.2f")")
            Text("Renovation Difficulty: \(fixerUpper.renovationDifficulty.rawValue)")
            Text("Renovation Priority Areas: \(fixerUpper.renovationPriorityAreas.joined(separator: ", "))")

            Text("Last Renovation: \(fixerUpper.formattedLastRenovationDate)")
            if !fixerUpper.renovationHistory.isEmpty {
                Text("Renovation History:")
                    .font(.subheadline)
                    .padding(.top, 4)
                ForEach(fixerUpper.renovationHistory, id: \.self) { renovation in
                    VStack(alignment: .leading) {
                        Text("- \(renovation.formattedRenovationDate): \(renovation.description) (\(renovation.cost, specifier: "%.2f"))")
                    }
                }
            }
        }
    }

    private var investmentDetailsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Investment Potential")
                .font(.headline)
                .padding(.bottom, 4)

            Text("Rental Income Potential: $\(fixerUpper.rentalIncomePotential, specifier: "%.2f")")
            Text("Expected ROI: \(fixerUpper.expectedROI, specifier: "%.2f")%")
        }
    }

    private var environmentDetailsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Environmental and Neighborhood Information")
                .font(.headline)
                .padding(.bottom, 4)

            Text("School District Rating: \(fixerUpper.schoolDistrictRating, specifier: "%.1f")/10")
            Text("Walkability Score: \(fixerUpper.walkabilityScore, specifier: "%.1f")/100")
            Text("Crime Rate: \(fixerUpper.crimeRate, specifier: "%.1f")")
        }
    }
}

#Preview {
    @Previewable @State var fixerUpper = fixerUpperData.first!

    DetailsView(fixerUpper: $fixerUpper)
}
