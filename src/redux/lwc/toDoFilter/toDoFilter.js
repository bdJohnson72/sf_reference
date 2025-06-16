/**
 * Created by brooksjohnson on 6/16/25.
 */

import {LightningElement} from 'lwc';

export default class ToDoFilter extends LightningElement {

    handleFilterClick(event){
        this.dispatchEvent(new CustomEvent('todofilterchange', {
            detail: event.target.name
        }))
    }

}