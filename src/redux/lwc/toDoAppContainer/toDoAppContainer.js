/**
 * Created by brooksjohnson on 6/16/25.
 */

import {LightningElement} from 'lwc';
import { createStore, combineReducers, createLogger } from "c/lwcRedux";
import reducers from "c/todoAppReducer"

let ENABLE_LOGGING = true;

export default class ToDoAppContainer extends LightningElement {

    @api store;

    initialize(){
        let logger;

        if(ENABLE_LOGGING){
            logger = createLogger({
                duration: true,
                diff: true,
            })
        }
        const combineReducersInstance = combineReducers(reducers);
        // eslint-disable-next-line @lwc/lwc/no-api-reassignments
        this.store = createStore(combineReducersInstance, logger)
    }

}