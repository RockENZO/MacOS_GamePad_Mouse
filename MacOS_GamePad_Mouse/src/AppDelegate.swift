import Cocoa


class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var gamepadManager: GamepadManager!
    var mouseController: MouseController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Set up the main window
        window = NSWindow(contentRect: NSMakeRect(0, 0, 800, 600),
                          styleMask: [.titled, .closable, .resizable],
                          backing: .buffered, defer: false)
        window.center()
        window.title = "Gamepad Mouse"
        window.makeKeyAndOrderFront(nil)

        // Initialize GamepadManager and MouseController
        gamepadManager = GamepadManager()
        

        // Start monitoring gamepad events
        gamepadManager.startMonitoringGamepad()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Clean up resources if needed
    }
}
