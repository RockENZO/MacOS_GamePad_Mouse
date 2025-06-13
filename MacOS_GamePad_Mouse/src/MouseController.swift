import Cocoa
import Foundation
import CoreGraphics

class MouseController {
    static let shared = MouseController()

    private init() {}

    func moveMouse(by delta: CGPoint) {
        DispatchQueue.main.async {
            let loc = NSEvent.mouseLocation
            let screenHeight = NSScreen.main?.frame.height ?? 0
            // macOS origin is bottom-left, but NSEvent.mouseLocation uses bottom-left
            let newLoc = CGPoint(x: loc.x + delta.x * 10, y: loc.y + delta.y * 10)
            // Clamp to screen bounds
            let clampedX = max(0, min(newLoc.x, NSScreen.main?.frame.width ?? newLoc.x))
            let clampedY = max(0, min(newLoc.y, screenHeight))
            CGWarpMouseCursorPosition(CGPoint(x: clampedX, y: clampedY))
        }
    }

    func clickMouse() {
        DispatchQueue.main.async {
            let loc = NSEvent.mouseLocation
            let mouseDown = CGEvent(mouseEventSource: nil, mouseType: .leftMouseDown, mouseCursorPosition: loc, mouseButton: .left)
            let mouseUp = CGEvent(mouseEventSource: nil, mouseType: .leftMouseUp, mouseCursorPosition: loc, mouseButton: .left)
            mouseDown?.post(tap: .cghidEventTap)
            mouseUp?.post(tap: .cghidEventTap)
        }
    }
}
