import { LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";

export default class NavigateToNavItem extends NavigationMixin(LightningElement) {

    navToTab(){
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'data_tables'
            }
        })
    }
}