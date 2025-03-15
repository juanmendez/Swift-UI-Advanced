import Foundation

extension FixerUpper {
    var formattedLastRenovationDate: String {
        guard let lastRenovationDate else { return "Never" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        return formatter.string(from: lastRenovationDate)
    }
    
    var formattedAskingPrice: String {
        self._currencyFormatter.string(from: NSNumber(value: self.askingPrice)) ?? "unknown"
    }
    
    private var _currencyFormatter: NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 0
        
        return currencyFormatter
    }
    
    var formattedExpectedROI: String {       
        return self._percentFormatter.string(from: NSNumber(value: self.expectedROI)) ?? "unknown"
    }
    
    private var _percentFormatter: NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .percent
        currencyFormatter.maximumFractionDigits = 1
        
        return currencyFormatter
    }
}

extension Renovation {
    var formattedRenovationDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        return formatter.string(from: date)
    }
}
