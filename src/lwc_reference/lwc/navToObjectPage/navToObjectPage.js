/**
 * Created by brooksjohnson on 4/11/24.
 */

import {LightningElement} from 'lwc';
import {NavigationMixin} from "lightning/navigation";

export default class NavToObjectPage extends NavigationMixin(LightningElement){

    handleNavigate(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            }
        });
    }

}