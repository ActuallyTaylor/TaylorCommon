import Foundation
import KeychainSwift
import HydrogenReporter

public class SharedDataStorageManager {
    public static var keychain: KeychainSwift {
        let keychain = KeychainSwift()
        keychain.accessGroup = Constants.keychainAccessGroup
        keychain.synchronizable = false
        return keychain
    }

    public static var defaults: UserDefaults {
        guard let defaults = UserDefaults(suiteName: Constants.suiteName) else {
            LOG("Unable to create shared User Defaults", level: .error)
            return UserDefaults.standard
        }
        return defaults
    }
}
