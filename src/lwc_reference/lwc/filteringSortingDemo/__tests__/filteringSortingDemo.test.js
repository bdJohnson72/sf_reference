/**
 * Created by brooksjohnson on 5/1/24.
 */

import {createElement} from 'lwc';
import FilteringSortingDemo from 'c/filteringSortingDemo'
import getContacts from '@salesforce/apex/LwcRefController.getContacts'

const contacts = require('./data/contacts.json')
jest.mock(
    '@salesforce/apex/LwcRefController.getContacts',
    () => {
        const {
            createApexTestWireAdapter
        } = require('@salesforce/sfdx-lwc-jest');
        return {
            default: createApexTestWireAdapter(jest.fn())
        };
    },
    { virtual: true }
);
describe('filters-sorting-demo suite', ()=> {
    afterEach(() => {
        while (document.body.firstChild){
            document.body.removeChild(document.body.firstChild);
        }
        jest.clearAllMocks();
    })
    async function flushPromises(){
        return Promise.resolve();
    }

    it('should render table', async () => {
       const element = createElement('c-filtering-sorting-demo', {
           is: FilteringSortingDemo
       })
        document.body.appendChild(element);
       getContacts.emit(contacts);
       await flushPromises();
       const tableRows = element.shadowRoot.querySelectorAll('tr');
        expect(tableRows.length).toEqual(contacts.length + 1)
    });
    it('should render a new table on filter', async () => {
        const element = createElement('c-filtering-sorting-demo', {
            is: FilteringSortingDemo
        });
        document.body.appendChild(element);
        getContacts.emit(contacts);
        await flushPromises();
        await flushPromises();
        const input = element.shadowRoot.querySelector('lightning-input');
        console.log(input);
        expect(input).not.toBeNull();
        input.value = 'rose';
        input.dispatchEvent(new CustomEvent('keypress'));
    });
})
