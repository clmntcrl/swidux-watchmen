# 🙂 SwiduxWatchmen

Middleware for action side effects in [Swidux](https://github.com/clmntcrl/swidux) using “Watchmen“ 🙂

## Stability

This library should be considered alpha, and not stable. Breaking changes will happen often.

## Usage

Create a `Watchmen` that could react to some actions to handle side effects and then dispatch other actions.

```swift
let doomsdayClockWatchmen = Watchmen { action in
    switch action {
    case DoomsdayClockAction.fetchDoomsdayClock:
        fetchDoomsdayClock {
            store.dispatch(DoomsdayClockAction.fetchDoomsdayClockSuccess(clock: $0))
        }
    default: break
    }
}
```

Add your watchmen to your `Store` middlewares.

```swift
import Swidux
import SwiduxWatchmen

let store = Store<AppState>(
    initialState: AppState(),
    reducer: reducer,
    middlewares: [
        .create(combiningWatchmen: [ doomsdayClockWatchmen ]),
    ]
)
```

## Installation

### [Carthage](https://github.com/Carthage/Carthage)

Add the following dependency to your `Cartfile`:

```ruby
github "clmntcrl/swidux-watchmen" ~> 0.2
```

### [CocoaPods](https://cocoapods.org)

Add the following pod to your `Podfile`:

```ruby
pod 'SwiduxWatchmen', '~> 0.2'
```

### [SwiftPM](https://github.com/apple/swift-package-manager)

Add the package as dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/clmntcrl/swidux-watchmen.git", from: "0.2.0"),
]
```

## License

SwiduxWatchmen is released under the MIT license. See [LICENSE](LICENSE) for details.
