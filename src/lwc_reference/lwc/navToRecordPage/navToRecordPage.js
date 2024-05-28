/**
 * Created by brooksjohnson on 4/30/24.
 */

import {LightningElement} from 'lwc';
import { NavigationMixin  } from "lightning/navigation";

export default class NavToRecordPage extends NavigationMixin(LightningElement) {

    recordViewMode(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '003al000000H3zNAAS',
                objectApiName: 'Contact',
                actionName: 'view'
            }
        })
    }
    recordEditMode(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '003al000000H3zNAAS',
                objectApiName: 'Contact',
                actionName: 'edit'
            }
        })
    }

}