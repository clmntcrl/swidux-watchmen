//  Created by Cyril Clément
//  Copyright © 2018 clmntcrl. All rights reserved.

import Foundation
import Swidux

public struct Watchmen {

    let watch: (Action) -> Void

    public init(watch: @escaping (Action) -> Void) {
        self.watch = watch
    }
}

private let watchmentQueue = DispatchQueue(
    label: "io.clmntcrl.watchmen-queue",
    qos: .utility,
    attributes: .concurrent
)

public extension Middleware {

    static func create<AppState>(combiningWatchmen watchmen: [Watchmen]) -> Middleware<AppState> {
        return Middleware<AppState> { _, action in
            watchmen.forEach { 🙂 in
                watchmentQueue.async { 🙂.watch(action) }
            }
        }
    }
}
