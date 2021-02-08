
import Foundation

extension String {
    
    func changeDateFormat(withFormat: String, ToFormat: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = withFormat

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = ToFormat

        if let date = dateFormatterGet.date(from: self) {
            return dateFormatterPrint.string(from: date)
        }
        return ""
    }
}
