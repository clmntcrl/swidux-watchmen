# 🙂 SwiduxWatchmen

[Swidux](https://github.com/clmntcrl/swidux) middleware for action side effects using "Watchmen".

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
        combineWatchmen([ doomsdayClockWatchmen ]),
    ]
)
```

## Installation

### [Carthage](https://github.com/Carthage/Carthage)

Add the following dependency to your Cartfile:

```
github "clmntcrl/swidux-watchmen" ~> 0.1.0
```

```
$ carthage update
```

You should encounter an issue (something like `Dependency "swidux-watchmen" has no shared framework schemes`) because libraries using SwiftPM are not currently supported by Carthage. This can be resolved with the following: 

```
$ (cd Carthage/Checkouts/swidux-watchmen && swift package generate-xcodeproj)
$ carthage build swidux-watchmen
```

### [SwiftPM](https://github.com/apple/swift-package-manager)

Add package as dependency:

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/clmntcrl/swidux-watchmen.git", from: "0.1.0"),
    ]
)
```

```
$ swift build
```

## License

SwiduxWatchmen is released under the MIT license. See [LICENSE](LICENSE) for details.
