import Foundation
import GameController

class GamepadManager: ObservableObject {
    @Published var isConnected: Bool = false
    @Published var lastLeftThumbstick: CGPoint = .zero
    @Published var lastButtonA: Bool = false

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
            isConnected = true
            setupGamepadInput(controller)
        }
    }
    
    @objc func gamepadDidDisconnect(notification: Notification) {
        if let controller = notification.object as? GCController, controller == gamepad {
            gamepad = nil
            isConnected = false
        }
    }
    
    private func setupGamepadInput(_ controller: GCController) {
        controller.extendedGamepad?.valueChangedHandler = { [weak self] (gamepad: GCExtendedGamepad, element: GCControllerElement) in
            self?.handleGamepadInput(gamepad)
        }
    }
    private func handleGamepadInput(_ gamepad: GCExtendedGamepad) {
        let mouseX = CGFloat(gamepad.leftThumbstick.xAxis.value)
        let mouseY = CGFloat(gamepad.leftThumbstick.yAxis.value)
        lastLeftThumbstick = CGPoint(x: mouseX, y: mouseY)
        lastButtonA = gamepad.buttonA.isPressed
        
        MouseController.shared.moveMouse(to: CGPoint(x: mouseX, y: mouseY))
        if gamepad.buttonA.isPressed {
            MouseController.shared.clickMouse()
        }
    }
}
