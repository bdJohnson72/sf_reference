/**
 * Created by brooksjohnson on 4/11/24.
 */

import {LightningElement} from 'lwc';
import {NavigationMixin} from "lightning/navigation";
import {encodeDefaultFieldValues} from "lightning/pageReferenceUtils";

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

   navigateToRecordWithValues(){
        const defaults = encodeDefaultFieldValues({
            FirstName: 'Bill',
            LastName: 'Smith',
            LeadSource: 'Other'
        })
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaults
            }
        })
   }

   navToListView(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'list'
            },
            state: {
                filterName: 'Mine'
            }
        })
   }
   navToFiles(){
        console.log('nav to files')
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'ContentDocument',
                actionName: 'home'
            }
        })
   }

}