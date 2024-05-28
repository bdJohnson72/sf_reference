/**
 * Created by brooksjohnson on 5/20/24.
 */

import {createElement} from 'lwc';
import NavToRelationshipPage from "c/navToRelationshipPage";
import { getNavigateCalledWith } from 'lightning/navigation';

describe('nav to record page test', () => {
    afterEach( ()=> {
        while (document.body.firstChild){
            document.body.removeChild(document.body.firstChild);
        }
    })

    async function flushPomises(){
        return Promise.resolve();
    }

    it('should call the nav mixin on click', ()=> {
        const NAV_TYPE = 'standard__recordRelationshipPage';
        const NAV_OBJECT_API_NAME = 'Account';
        const NAV_RELATIONSHIP_API_NAME = 'Contacts';
        const NAV_ACTION_NAME = 'view';
        const NAV_RECORD_ID = '0013O00000Asx5LQAR';
        const element = createElement('c-nav-to-relationship-page', {
            is: NavToRelationshipPage
        });
        document.body.appendChild(element);
        element.recordId = NAV_RECORD_ID;
        const button =  element.shadowRoot.querySelector('lightning-button');
        button.click();
        const nav_reference = getNavigateCalledWith();
        console.log(nav_reference);
        expect(nav_reference.pageReference.type).toBe('standard__recordRelationshipPage');
        expect(nav_reference.pageReference.attributes.objectApiName).toBe('Account');
        expect(nav_reference.pageReference.attributes.relationshipApiName).toBe('Contacts');
        expect(nav_reference.pageReference.attributes.actionName).toBe('view');
        expect(nav_reference.pageReference.attributes.recordId).toBe(NAV_RECORD_ID);

    })

});