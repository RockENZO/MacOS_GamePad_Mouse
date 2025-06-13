import Cocoa

class MouseController {
    
    func moveMouse(to point: NSPoint) {
        let mouseEventDown = NSEvent.mouseEvent(with: .leftMouseDown, location: point, modifierFlags: [], timestamp: 0, windowNumber: 0, context: nil, eventNumber: 0, clickCount: 1, pressure: 1.0)
        let mouseEventUp = NSEvent.mouseEvent(with: .leftMouseUp, location: point, modifierFlags: [], timestamp: 0, windowNumber: 0, context: nil, eventNumber: 0, clickCount: 1, pressure: 1.0)
        
        if let downEvent = mouseEventDown, let upEvent = mouseEventUp {
            NSEvent.addLocalMonitorForEvents(matching: .leftMouseDown) { _ in return downEvent }
            NSEvent.addLocalMonitorForEvents(matching: .leftMouseUp) { _ in return upEvent }
        }
    }
    
    func clickMouse() {
        let mouseEventDown = NSEvent.mouseEvent(with: .leftMouseDown, location: NSEvent.mouseLocation, modifierFlags: [], timestamp: 0, windowNumber: 0, context: nil, eventNumber: 0, clickCount: 1, pressure: 1.0)
        let mouseEventUp = NSEvent.mouseEvent(with: .leftMouseUp, location: NSEvent.mouseLocation, modifierFlags: [], timestamp: 0, windowNumber: 0, context: nil, eventNumber: 0, clickCount: 1, pressure: 1.0)
        
        if let downEvent = mouseEventDown, let upEvent = mouseEventUp {
            NSEvent.addLocalMonitorForEvents(matching: .leftMouseDown) { _ in return downEvent }
            NSEvent.addLocalMonitorForEvents(matching: .leftMouseUp) { _ in return upEvent }
        }
    }
}