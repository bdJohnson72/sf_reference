/**
 * Created by brooksjohnson on 6/16/25.
 */

import {LightningElement, api, track} from 'lwc';

export default class BaseToDo extends LightningElement {
   @track _todo = {}
    @api set todo(data){
        this._todo = data;
    }

    get todo(){
        return this._todo;
    }

    handleStatusChange(event){
        console.log(`handling status change ${event.target.name}`)
        const todo = {...this.todo, status: event.target.name}; // Create new object
        this.dispatchEvent(new CustomEvent('todostatuschange', {
            detail: todo,
        }))

    }

    get statusColorClass() {
        console.log('Todo status:', this.todo.status);
        if (this.todo.status === 'Complete') {
            return 'status-complete';
        } else if (this.todo.status === 'In Progress') {
            return 'status-in-progress';
        } else {
            return 'status-not-started';
        }
    }
}