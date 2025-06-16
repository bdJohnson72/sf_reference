/**
 * Created by brooksjohnson on 6/16/25.
 */

import {LightningElement} from 'lwc';

export default class AddToDo extends LightningElement {

    toDoValue = '';

    handleToDoChange(event){
        this.toDoValue = event.target.value;
    }

    handleAddToDo(){
        this.dispatchEvent(new CustomEvent('addtodo', {
            detail: {
                value: this.toDoValue
            }
        }))
        this.toDoValue = '';
    }



}