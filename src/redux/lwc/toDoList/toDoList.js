/**
 * Created by brooksjohnson on 6/16/25.
 */

import {LightningElement, api } from 'lwc';

export default class ToDoList extends LightningElement {
    _toDos = [];
    @api currentFilter = '';


    @api set todos(data){
        this._toDos = data;
        console.log(`setting todos ${JSON.stringify(data)}`);
    }

    get todos(){
        console.log('getting todos')
        return this._toDos;
    }

    handleToDoStatusChange(event){
        console.log('handleToDoStatusChange list', event);
        this.dispatchEvent(new CustomEvent('todostatuschange', {
            detail: event.detail,
        }))
    }
}