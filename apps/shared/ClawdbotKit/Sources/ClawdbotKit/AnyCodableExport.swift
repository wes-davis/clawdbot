import ClawdbotProtocol

/// Re-export AnyCodable from ClawdbotProtocol so consumers of ClawdbotKit can
/// reference it as `ClawdbotKit.AnyCodable` or just `AnyCodable`.
public typealias AnyCodable = ClawdbotProtocol.AnyCodable
