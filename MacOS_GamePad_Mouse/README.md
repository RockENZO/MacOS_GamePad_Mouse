# Gamepad Mouse for macOS

This project allows you to use a game controller to navigate your macOS system and simulate mouse clicks. It also provides functionality to map gamepad buttons to specific keyboard keys.

## Features

- Navigate the macOS interface using a gamepad.
- Simulate mouse movements and clicks.
- Map gamepad buttons to keyboard keys for additional functionality.

## Project Structure

- `src/AppDelegate.swift`: Manages the app's lifecycle events and initializes the gamepad and mouse controllers.
- `src/GamepadManager.swift`: Handles gamepad connections and input events.
- `src/MouseController.swift`: Simulates mouse movements and clicks based on gamepad input.
- `src/KeyMapper.swift`: Maps gamepad buttons to keyboard keys.
- `src/Main.storyboard`: Defines the user interface layout for the application.
- `Info.plist`: Contains configuration settings for the macOS application.
- `Package.swift`: Configuration file for Swift Package Manager.

## Setup Instructions

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/gamepad-mouse-macos.git
   ```

2. Open the project in Xcode.

3. Build and run the application.

4. Connect your game controller and start navigating!

## Usage

- Use the left joystick to move the mouse cursor.
- Press the designated buttons to simulate mouse clicks.
- Customize button mappings through the KeyMapper class.

## Contributing

Feel free to submit issues or pull requests for improvements or new features. 

## License

This project is licensed under the MIT License. See the LICENSE file for more details.