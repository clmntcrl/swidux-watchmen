# 🙂 SwiduxWatchmen

Swidux middleware for action side effects using "Watchmen".

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

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/clmntcrl/swidux-watchmen.git", .branch("master")),
    ]
)
```

## License

SwiduxWatchmen is released under the MIT license. See [LICENSE](LICENSE]) for details.
