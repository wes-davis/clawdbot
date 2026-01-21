import ClawdbotKit
import ClawdbotProtocol
import Foundation

// ClawdbotKit.AnyCodable is a typealias to ClawdbotProtocol.AnyCodable,
// so we only need one extension. Use ClawdbotProtocol for clarity.
typealias AnyCodable = ClawdbotProtocol.AnyCodable
typealias InstanceIdentity = ClawdbotKit.InstanceIdentity

extension ClawdbotProtocol.AnyCodable {
    var stringValue: String? { self.value as? String }
    var boolValue: Bool? { self.value as? Bool }
    var intValue: Int? { self.value as? Int }
    var doubleValue: Double? { self.value as? Double }
    var dictionaryValue: [String: ClawdbotProtocol.AnyCodable]? { self.value as? [String: ClawdbotProtocol.AnyCodable] }
    var arrayValue: [ClawdbotProtocol.AnyCodable]? { self.value as? [ClawdbotProtocol.AnyCodable] }

    var foundationValue: Any {
        switch self.value {
        case let dict as [String: ClawdbotProtocol.AnyCodable]:
            dict.mapValues { $0.foundationValue }
        case let array as [ClawdbotProtocol.AnyCodable]:
            array.map(\.foundationValue)
        default:
            self.value
        }
    }
}
