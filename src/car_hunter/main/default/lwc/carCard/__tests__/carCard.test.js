/**
 * Created by bjohnson on 2/28/24.
 */

import {createElement} from 'lwc';
import CarCard from "c/carCard";

describe('c-car-card test suite', () => {
    afterEach(  () => {
        while (document.body.firstChild){
            document.body.removeChild(document.body.firstChild);
        }
    })
    it('should render contact form with input values', () => {
        const record_input = [{
            fieldApiName: 'Category__c',
            objectApiName: 'Car_c'
        },
            {
                fieldApiName: 'MSRP__c',
                objectApiName: 'Car_c'
            }
        ];
        const recordId = 'a00O1000005oLVXIA2';
        const objectAPIName = 'Car__c';
        const element = createElement('c-car-card',  {
            is: CarCard
        });
        element.recordId = recordId;
        document.body.appendChild(element);
        const formEl = element.shadowRoot.querySelectorAll('lightning-output-field');
        expect(formEl.length).toBe(6);
    });
})

