import SwiftUI

#Preview {
    let fixerUpper = fixerUpperData[0]
    
    //MARK: ⬇️ Start copying from here ⬇️
    VStack {
        Text(fixerUpper.name)
            .font(.headline)
            .padding(.top, 20)
        
        HStack(spacing: 12) {
            VStack(alignment: .leading) {
                Text("Asking price")
                    .foregroundStyle(.secondary)
                Text(fixerUpper.formattedAskingPrice)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Condition")
                    .foregroundStyle(.secondary)
                Text(fixerUpper.condition.rawValue)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Expected ROI")
                    .foregroundStyle(.secondary)
                Text(fixerUpper.formattedExpectedROI)
            }
            .font(.subheadline)
            .fontWeight(.semibold)

        }
        .frame(height: 44)
        
        HStack {
            Spacer()
            HStack {
                Image(systemName: fixerUpper.isFavorite ? "star.fill" : "star")
                Divider()
                Image(systemName: "ellipsis")
            }
            .padding()
            .frame(height: 44)
        }
        .background(.ultraThinMaterial)
    }
    .background(.thinMaterial)
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .overlay {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(LinearGradient(colors: [.clear, .primary, .clear], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.3))
    }
    .padding(10)
    .frame(maxWidth: 375)
    //MARK: ⬆️ End copying here ⬆️
}
