//
//  ViewController.swift
//  ReSwiftSample
//
//  Created by koogawa on 2016/05/04.
//  Copyright © 2016 koogawa. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var label: UILabel!

//    private let store: Store<AppState> = Store<AppState>(reducer: CounterReducer(), state: AppState(counter: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        store.subscribe(self)
    }

    override func viewWillDisappear(animated: Bool) {
        store.unsubscribe(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func newState(state: AppState) {
        label.text = String(state.counter)
    }

    @IBAction func didTapIncreaseButton(sender: AnyObject) {
        store.dispatch(CountActionIncrease())
    }

    @IBAction func didTapDecreaseButton(sender: AnyObject) {
        store.dispatch(CountActionDecrease())
    }

    @IBAction func didTapNewButton(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier("MainViewController")
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    @IBAction func didTapDismissButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

