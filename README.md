# ANZTask
 SwiftUI-based iOS application developed using the MVVM architecture. The app demonstrates clean architecture principles, modular design, and includes UI and Unit Testing.

## Features

- MVVM Architecture
- SwiftUI Interface
- User List Display
- Dependency Injection
- Modular Components
- Unit and UI Testing

## Project Structure

```
ANZTask/
├── Models/               # Data models (e.g., User.swift)
├── ViewModels/           # View models (e.g., UserListViewModel.swift)
├── Views/                # SwiftUI views (e.g., ContentView.swift)
├── Dependency/           # Dependency factories (e.g., ListViewFactory.swift)
├── Resources/Assets/     # Asset catalogs and colors
├── ANZTaskApp.swift      # App entry point
├── Tests/
│   ├── UnitTests/        # Unit tests
│   └── UITests/          # UI tests
```

## Flow Summary :
1. App starts via ANZTaskApp.swift.
2. ListViewFactory injects UserService into UserListViewModel.
3. UserListView shows list using UserListViewModel.users.
4. ViewModel uses async/await to fetch data via UserService.
5. Upon user tap, NavigationLink leads to UserDetailView.
6. All updates are reactive via @Published (Combine).
7. Unit & UI tests ensure functional reliability.

## Flow Diagram

![image](https://github.com/user-attachments/assets/ebf8e6da-c3f1-4253-8dbc-eda0959ab5e2)

## UML Diagram

![image](https://github.com/user-attachments/assets/c13cd514-c900-49ec-b6aa-4cceb5d50fd6)


## Getting Started

1. Clone the repository or download the project.
2. Open `ANZTask.xcodeproj` in Xcode.
3. Build and run the app on the iOS simulator or a physical device.

## Testing

The project includes:

- **Unit Tests**: Located in the `ANZTaskTests` folder.
- **UI Tests**: Located in the `ANZTaskUITests` folder.

To run tests:
```bash
Cmd + U
```

## Dependencies

- Swift 5+
- Xcode 15+
- iOS 15+

 
## 📄 License

[MIT License](LICENSE)
