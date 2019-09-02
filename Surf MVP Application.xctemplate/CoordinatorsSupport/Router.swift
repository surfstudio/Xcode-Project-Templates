//
//  Copyright © 2018 Surf. All rights reserved.
//

/// Describes object that handles all navigation operations
protocol Router {
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)

    func popModule()
    func popModule(animated: Bool)
    func popPreviousView()

    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func setNavigationControllerRootModule(_ module: Presentable?, animated: Bool, hideBar: Bool)
    func setRootModule(_ module: Presentable?)

    func setTab(_ index: Int)
}
