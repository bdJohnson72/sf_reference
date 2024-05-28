/**
 * Created by brooksjohnson on 5/20/24.
 */

import {LightningElement, api} from 'lwc';
import { NavigationMixin } from "lightning/navigation";

export default class NavToRelationshipPage extends NavigationMixin(LightningElement){
    @api recordId
    handleClick(){
        console.log(this.recordId)
        this[NavigationMixin.Navigate]({
            type: 'standard__recordRelationshipPage',
            attributes: {
                objectApiName: 'Account',
                relationshipApiName: 'Contacts',
                actionName: 'view',
                recordId: this.recordId
            }
        })

    }

}