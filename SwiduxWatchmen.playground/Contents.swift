/*:
 # 🙂 SwiduxWatchmen

 Swidux middleware for action side effects using "Watchmen"  🙂
 */
import Foundation
import Swidux
import SwiduxWatchmen

struct AppState {
    var doomsdayClock: String? = .none
}

var store: Store<AppState>!

enum DoomsdayClockAction: Action {
    case fetchDoomsdayClock
    case fetchDoomsdayClockSuccess(clock: String)
}

let doomsdayClockReducer = Reducer<String?> { state, action in
    switch action {
    case DoomsdayClockAction.fetchDoomsdayClockSuccess(let clock): state = clock
    default: break
    }
}

func fetchDoomsdayClock(then: @escaping (String) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        then("It is now two minutes to midnight")
    }
}

let doomsdayClockWatchmen = Watchmen { action in
    switch action {
    case DoomsdayClockAction.fetchDoomsdayClock:
        fetchDoomsdayClock {
            store.dispatch(DoomsdayClockAction.fetchDoomsdayClockSuccess(clock: $0))
        }
    default: break
    }
}

store = Store<AppState>(
    initialState: AppState(),
    reducer: doomsdayClockReducer.lift(\.doomsdayClock),
    middlewares: [
        combineWatchmen([ doomsdayClockWatchmen ]),
    ]
)

let token = store.subscribe(\.doomsdayClock) {
    $0.flatMap { clock in print(clock) }
}

store.dispatch(DoomsdayClockAction.fetchDoomsdayClock)
