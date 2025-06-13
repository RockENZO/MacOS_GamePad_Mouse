import Foundation
import GameController

class GamepadManager {
    var gamepad: GCController?
    
    init() {
        startMonitoringGamepad()
    }
    
    func startMonitoringGamepad() {
        NotificationCenter.default.addObserver(self, selector: #selector(gamepadDidConnect), name: .GCControllerDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(gamepadDidDisconnect), name: .GCControllerDidDisconnect, object: nil)
        
        GCController.startWirelessControllerDiscovery { }
    }
    
    @objc func gamepadDidConnect(notification: Notification) {
        if let controller = notification.object as? GCController {
            gamepad = controller
            setupGamepadInput(controller)
        }
    }
    
    @objc func gamepadDidDisconnect(notification: Notification) {
        if let controller = notification.object as? GCController, controller == gamepad {
            gamepad = nil
        }
    }
    
    private func setupGamepadInput(_ controller: GCController) {
        controller.extendedGamepad?.valueChangedHandler = { [weak self] (gamepad) in
            self?.handleGamepadInput(gamepad)
        }
    }
    
    private func handleGamepadInput(_ gamepad: GCExtendedGamepad) {
        // Example: Move mouse based on left thumbstick input
        let mouseX = CGFloat(gamepad.leftThumbstick.xAxis.value)
        let mouseY = CGFloat(gamepad.leftThumbstick.yAxis.value)
        
        MouseController.shared.moveMouse(to: CGPoint(x: mouseX, y: mouseY))
        
        // Example: Click mouse if button pressed
        if gamepad.buttonA.isPressed {
            MouseController.shared.clickMouse()
        }
        
        // Additional button mappings can be handled here
    }
}