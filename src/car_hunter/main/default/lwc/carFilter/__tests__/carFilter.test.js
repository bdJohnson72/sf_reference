/**
 * Created by bjohnson on 2/19/24.
 */

import {createElement} from 'lwc';
import CarFilter from "c/carFilter";

describe('c-car-filter test suite', () => {
    afterEach(() =>{
        while (document.body.firstChild){
            document.body.removeChild(document.body.firstChild);
        }
    })
    function flushPromises(){
        return Promise.resolve();
    }
    it('should call handleSearch', async () =>{
        const element = createElement('c-car-filter', {
            is: CarFilter
        })
        document.body.appendChild(element);
        const inputEl = element.shadowRoot.querySelector('input');
        inputEl.dispatchEvent(new CustomEvent('change'));
        await flushPromises();
    })
});
