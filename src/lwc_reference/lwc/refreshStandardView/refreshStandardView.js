/**
 * Created by brooksjohnson on 5/7/24.
 */

import {LightningElement} from 'lwc';
import { RefreshEvent } from "lightning/refresh";
import NAME_FIELD from '@salesforce/schema/Contact.Name'
import PHONE_FIELD from '@salesforce/schema/Contact.Phone'
import EMAIL_FIELD from '@salesforce/schema/Contact.Email'
import ACCOUNT_FIELD  from '@salesforce/schema/Contact.AccountId'

export default class RefreshStandardView extends LightningElement {
    nameField = NAME_FIELD;
    phoneField = PHONE_FIELD;
    emailField = EMAIL_FIELD;
    accountField = ACCOUNT_FIELD;

    handleSubmit(){}

    handleSuccess(event){
        console.log(`contact created ${event.detail.id}`)
        this.handleReset();
        this.dispatchEvent(new RefreshEvent());
    }

    handleReset(){
        const inputFields = Array.from(this.template.querySelectorAll('lightning-input-field'));
        console.log('input fields' + inputFields )
        if (inputFields){

            inputFields.forEach(field => {
                console.log(field);
                field.reset()
            });
        }
    }
}