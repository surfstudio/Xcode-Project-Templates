//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

/// Base protocol for all view. If need to do custom transition then should
/// create new protocol, implement current and override desired method
///
/// Examples:
///
/// 1. If screen A can be open from screnn B with custom transition
///
/// ```
/// protocol CustomModuleTransitionable: class, ModuleTransitionable {
/// }
///
/// extension CustomModuleTransitionable {
///    func showModule(_ module: UIViewController) {
///        *do something custom to show B*
///    }
///}
/// ```
///
/// 2. If screen A can be open from screen B, C, D in different ways
///
/// ```
///protocol CustomModuleTransitionable: class, ModuleTransitionable {
///    func showModuleWithCustomTransitionFromB(_ module: UIViewController)
///    func showModuleWithCustomTransitionFromC(_ module: UIViewController)
///    func showModuleWithCustomTransitionFromD(_ module: UIViewController)
///}
///
///extension CustomModuleTransitionable {
///    func showModuleWithCustomTransitionFromB(_ module: UIViewController) {
///        *do something custom to show from B*
///    }
///    func showModuleWithCustomTransitionFromC(_ module: UIViewController) {
///        *do something custom to show from С*
///    }
///    func showModuleWithCustomTransitionFromD(_ module: UIViewController) {
///        *do something custom to show from D*
///    }
///}
///```
protocol ModuleTransitionable: class {
    func showModule(_ module: UIViewController)
    func dismissView(animated: Bool, completion: (() -> Void)?)
    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func push(module: UIViewController, animated: Bool)
    func push(module: UIViewController, animated: Bool, hideTabBar: Bool)
}

extension ModuleTransitionable where Self: UIViewController {

    func showModule(_ module: UIViewController) {
        self.show(module, sender: nil)
    }

    func dismissView(animated: Bool, completion: (() -> Void)?) {
        self.presentingViewController?.dismiss(animated: animated, completion: completion)
    }

    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.present(module, animated: animated, completion: completion)
    }

    func pop(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }

    func push(module: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(module, animated: animated)
    }

    func push(module: UIViewController, animated: Bool, hideTabBar: Bool = false) {
        module.hidesBottomBarWhenPushed = hideTabBar
        push(module: module, animated: animated)
    }
}
