# BooksOrbit

BooksOrbit is a SwiftUI-based, iOS-first multiplatform application that allows users to explore and discover technical books using the itbook.store API.

The app is designed with a production-oriented mindset, emphasizing clean architecture, offline support, efficient caching, and extensibility to visionOS.

---

## Platforms
- iOS
- visionOS

A single SwiftUI codebase is shared across platforms, with adaptive UI where necessary.

---

## Tech Stack
- SwiftUI
- Swift Concurrency (async/await)
- URLSession
- Codable
- FileManager
- Apple first-party frameworks only

No third-party libraries or project generators are used.

---

## Architecture

BooksOrbit follows a **feature-oriented MVVM architecture** with a shared Core layer.

### Layers
- **Core**
  - Networking
  - Models
  - Persistence
  - Caching
  - Recommendation Engine
- **Features**
  - Home
  - Detail
- **Platform**
  - iOS-specific navigation and UI behavior
  - visionOS-specific spatial adaptations

This structure ensures testability, scalability, and clear separation of concerns.

---

## Data Flow

SwiftUI View  
→ ViewModel  
→ Core (Network / Cache / Persistence / AI)  
→ ViewModel  
→ View

Views are declarative and stateless.  
ViewModels manage state and user intent.

---

## Offline Support

- Previously fetched book data is persisted locally using Codable and FileManager
- Cached content remains accessible when the device is offline
- Error handling is explicit and deterministic

---

## Image Caching

- In-memory cache for fast access
- Disk cache for persistence across launches
- Duplicate image downloads are prevented
- Cache behavior is deterministic and unit-testable

---

## Lightweight AI / Recommendation Engine

BooksOrbit includes an on-device recommendation engine that improves content discovery without relying on external AI services.

Signals used:
- Content recency
- User interaction frequency
- Offline availability

The recommendation logic is deterministic, privacy-friendly, and fully testable.

---

## Multiplatform Strategy

- Core logic and ViewModels are shared
- Platform-specific UI differences are isolated
- SwiftUI conditional compilation and environment adaptation are used where required

This approach aligns with Apple’s recommended multiplatform development practices.

---

## Testing Strategy

- ViewModels tested using mocked Core dependencies
- Networking tested via URLSession abstraction
- Caching and recommendation logic tested independently

---

## Notes

UI design is intentionally minimal, as visual polish is not part of the evaluation criteria.  
The focus is on architecture, correctness, and maintainability.
