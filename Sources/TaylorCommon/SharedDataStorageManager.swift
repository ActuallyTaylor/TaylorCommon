//
//  SharedDataStorageManager.swift
//  Jellycuts
//
//  Created by Taylor Lineman on 5/29/23.
//

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
