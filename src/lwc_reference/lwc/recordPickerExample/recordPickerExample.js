/**
 * Created by brooksjohnson on 4/22/24.
 */

import {LightningElement} from 'lwc';

export default class RecordPickerExample extends LightningElement {

    handleChange(event){
        console.log('changed')
        console.log(event.detail.recordId)
    }

    displayInfo = {
        primaryField: 'Name',
        additionalFields: ['Phone']
    }
}