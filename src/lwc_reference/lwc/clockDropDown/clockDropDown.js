/**
 * Created by bjohnson on 2/9/24.
 */

import {LightningElement, api} from 'lwc';

export default class ClockDropDown extends LightningElement {
    @api label = ''
    @api options = [];
    @api uniqueId = ''

    handleChange(event){
       this.callParent(event.target.value);
    }

    callParent(value){
        this.dispatchEvent(new CustomEvent('optionchange', {
            detail: {name: this.label, value: value}
        }))
    }

    @api reset(value){
        this.template.querySelector('select').value = value;
    }

}