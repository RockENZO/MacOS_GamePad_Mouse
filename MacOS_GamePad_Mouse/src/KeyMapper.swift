import Foundation

class KeyMapper {
    private var keyMappings: [String: String] = [:]

    func setMapping(gamepadButton: String, keyboardKey: String) {
        keyMappings[gamepadButton] = keyboardKey
    }

    func getMapping(for gamepadButton: String) -> String? {
        return keyMappings[gamepadButton]
    }

    func removeMapping(for gamepadButton: String) {
        keyMappings.removeValue(forKey: gamepadButton)
    }

    func clearMappings() {
        keyMappings.removeAll()
    }

    func getAllMappings() -> [String: String] {
        return keyMappings
    }
}