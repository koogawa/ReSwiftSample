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

    private let store: Store<AppState> = Store<AppState>(reducer: CounterReducer(), state: AppState(counter: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        store.subscribe(self)
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
}

