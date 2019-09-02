//
//  Copyright © 2018 Surf. All rights reserved.
//

import UIKit

/// Describes object that can be presented in view hierarchy
protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }

}
