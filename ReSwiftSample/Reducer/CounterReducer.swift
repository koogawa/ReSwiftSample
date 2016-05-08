//
//  CounterReducer.swift
//  ReSwiftSample
//
//  Created by koogawa on 2016/05/08.
//  Copyright © 2016 koogawa. All rights reserved.
//

import Foundation
import ReSwift

struct CounterReducer: Reducer {
    typealias ReducerStateType = AppState

    func handleAction(action: Action, state: ReducerStateType?) -> ReducerStateType {
        print(action, state)
        switch action {
        case _ as CountActionIncrease:
            return AppState(counter: state.map { $0.counter + 1 } ?? 0)
        case _ as CountActionDecrease:
            return AppState(counter: state.map { $0.counter - 1 } ?? 0)
        default:
            return AppState(counter: 0)
        }
    }
}