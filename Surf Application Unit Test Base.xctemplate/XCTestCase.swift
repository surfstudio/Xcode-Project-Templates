//
//  Copyright © 2019 Surf. All rights reserved.
//

import XCTest

private class Weak<T: AnyObject> {
    weak var value: T?
    init (value: T) {
        self.value = value
    }
}

extension XCTestCase {

    /// Verifies whether the given constructed UIViewController and its dependencies
    /// get deallocated after being presented and dismissed.
    ///
    /// - Parameter objects: Сonstructor to use for creating the view controller and its dependencies.
    func assertDeallocation(of objects: () -> (UIViewController, [AnyObject])) {
        // Box for the view controller
        weak var weakReferenceViewController: UIViewController?
        // Box for dependecies
        var weakReferenceDependencies: [Weak<AnyObject>] = []

        let autoreleasepoolExpectation = expectation(description: "Autoreleasepool should drain")

        autoreleasepool {
            let rootViewController = UIViewController()

            // Make sure that the view is active and we can use it for presenting views.
            let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()

            let (testedViewController, dependencies) = objects()

            /// Present and dismiss the view after which the view controller should be released.
            rootViewController.present(
                testedViewController,
                animated: false,
                completion: {
                    // Set presented controller to box
                    weakReferenceViewController = rootViewController.presentedViewController
                    // Set dependencies to box
                    dependencies.forEach {
                        weakReferenceDependencies.append(Weak(value: $0))
                    }
                    // Check that none of them are deallocated
                    XCTAssertNotNil(weakReferenceViewController)
                    weakReferenceDependencies.forEach {
                        XCTAssertNotNil($0)
                    }
                    rootViewController.dismiss(
                        animated: false,
                        completion: {
                            autoreleasepoolExpectation.fulfill()
                        }
                    )
                }
            )
        }
        wait(for: [autoreleasepoolExpectation], timeout: 5.0)
        wait(
            for: weakReferenceViewController == nil,
            timeout: 3.0,
            description: "The view controller should be deallocated since no strong reference points to it."
        )
        wait(
            for: weakReferenceDependencies.filter { $0.value != nil }.isEmpty,
            timeout: 3.0,
            description: "Dependencies of the controller should be deallocated since no strong reference points to it."
        )
    }

    /// Checks for the callback to be the expected value within the given timeout.
    ///
    /// - Parameters:
    ///   - condition: The condition to check for.
    ///   - timeout: The timeout in which the callback should return true.
    ///   - description: A string to display in the test log for this expectation, to help diagnose failures.
    func wait(for condition: @autoclosure @escaping () -> Bool,
              timeout: TimeInterval,
              description: String,
              file: StaticString = #file,
              line: UInt = #line) {
        let end = Date().addingTimeInterval(timeout)

        var value: Bool = false
        let closure: () -> Void = {
            value = condition()
        }

        while !value && 0 < end.timeIntervalSinceNow {
            if RunLoop.current.run(mode: RunLoop.Mode.default, before: Date(timeIntervalSinceNow: 0.002)) {
                Thread.sleep(forTimeInterval: 0.002)
            }
            closure()
        }

        closure()

        XCTAssertTrue(
            value,
            "➡️🚨 Timed out waiting for condition to be true: \"\(description)\"",
            file: file,
            line: line
        )
    }

}

extension XCTestCase {

    func expectationWithDescription(_ description: String,
                                    timeout: TimeInterval,
                                    performBlock:(_ expectation: XCTestExpectation) -> Void) {
        let expectation = self.expectation(description: description)
        performBlock(expectation)
        waitForExpectations(timeout: timeout, handler: nil)
    }

}
