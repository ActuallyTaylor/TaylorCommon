#if canImport(UIKit)
import UIKit

public struct Haptics {
    
    enum HapticKey: String {
        case enabled
    }
    
    static var supported: Bool {
        (UIDevice.current.value(forKey: "_feedbackSupportLevel") as? Int) == 2
    }
    
    static var enabled: Bool {
        PreferenceManager.getHapticsEnabled()
    }
    
    static func playSuccess() {
        if !(enabled && supported) { return }
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.success)
    }
    
    static func playError() {
        if !(enabled && supported) { return }
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.error)
    }
    
    static func playLightImpact() {
        if !(enabled && supported) { return }
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }
    
    static func playMediumImpact() {
        if !(enabled && supported) { return }
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
    
    static func playHeavyImpact() {
        if !(enabled && supported) { return }
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
    
    static func playSelectionImpact() {
        if !(enabled && supported) { return }
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
}
#endif

// MARK: Haptics
public extension PreferenceManager {
    static func getHapticsEnabled() -> Bool {
        return SharedDataStorageManager.defaults.bool(forKey: Haptics.HapticKey.enabled.rawValue)
    }
    
    static func saveHaptics(enabled: Bool) {
        SharedDataStorageManager.defaults.set(enabled, forKey: Haptics.HapticKey.enabled.rawValue)
    }
}
