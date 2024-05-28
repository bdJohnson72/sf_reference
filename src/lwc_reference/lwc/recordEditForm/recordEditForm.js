/**
 * Created by brooksjohnson on 5/8/24.
 */

import {LightningElement} from 'lwc';
import CONTACT from '@salesforce/schema/Contact'
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import TITLE from '@salesforce/schema/Contact.Title';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';

export default class RecordEditForm extends LightningElement {

    objectName = CONTACT;
    fields = {
        account: ACCOUNT_FIELD,
        name: NAME_FIELD,
        title: TITLE,
        phone: PHONE_FIELD,
        email: EMAIL_FIELD,
    }

    handleCancel(){
        const inputFields = this.template.querySelectorAll('lightning-input-field');
        if (inputFields){
            Array.from(inputFields).forEach(field => field.reset());
        }
    }
}