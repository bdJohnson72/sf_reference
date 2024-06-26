/**
 * Created by brooksjohnson on 6/14/24.
 */

import {createElement} from 'lwc';
import ClockDropDown from "c/clockDropDown";

describe('c-clock-dropdown test suite', () => {
   afterEach(() => {
       while (document.body.firstChild){
           document.body.removeChild(document.body.firstChild);
       }
       jest.clearAllMocks();
   }) 
    async function flushPromises(){
       return Promise.resolve();
    }

    it('should render component',async () => {
        const element = createElement('c-clock-drop-down', {
            is: ClockDropDown
        })
        document.body.appendChild(element);
        const handler = jest.fn();
        element.addEventListener('optionchange', handler);
        element.label = 'label';
        element.options = [1, 2, 3, 4];
        element.uniqueId = 'label';
        await flushPromises();
       const label = element.shadowRoot.querySelector('.slds-form-element__label');
       expect(label.textContent).toBe('label');
       const options = Array.from(element.shadowRoot.querySelectorAll('option'));
       expect(options.length).toBe(4);
       const selectEl = element.shadowRoot.querySelector('select');
       selectEl.value = 4;
       selectEl.dispatchEvent(new CustomEvent('change'));
       await flushPromises();
       expect(handler).toHaveBeenCalledTimes(1);
       const eventDetail = handler.mock.calls[0][0].detail;
       expect(eventDetail).toEqual({name: 'label', value: '4'})
        
    });
});