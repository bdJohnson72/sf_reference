/**
 * Created by brooksjohnson on 6/14/24.
 */

import {createElement} from 'lwc';
import BmiCalculator from "c/bmiCalculator";

describe('c-bmi-calculator test suite', () => {
    afterEach(() => {
        while (document.body.firstChild){
            document.body.removeChild(document.body.firstChild);
        }
        jest.clearAllMocks();
    })
    async function flushPromises(){
        return Promise.resolve();
    }

    it('should render intial setup correctly', () => {
        const element = createElement('c-bmi-calculator', {
            is: BmiCalculator
        })
        document.body.appendChild(element);
        const inputEls = Array.from(element.shadowRoot.querySelectorAll('input'));
        expect(inputEls.length).toBe(2);
        const button = element.shadowRoot.querySelector('button');
        expect(button).not.toBeNull();
    });
    it('should calculate BMI',async () => {
       const element = createElement('c-bmi-calculator', {
           is: BmiCalculator
       });
       document.body.appendChild(element);
       const inputs = Array.from(element.shadowRoot.querySelectorAll('input'));
       inputs[0].value = 73;
       inputs[0].dispatchEvent(new CustomEvent('change'))
       inputs[1].value = 210;
       inputs[1].dispatchEvent(new CustomEvent('change'))
       const  button = element.shadowRoot.querySelector('button');
       button.click();
       await flushPromises();
       const result = element.shadowRoot.querySelector('.bmi-result');
       expect(result).not.toBeNull();
       expect(result.textContent).toBe('Your BMI is 27.70')
    });
    it('should handle recalculate',async () => {
        const element = createElement('c-bmi-calculator', {
            is: BmiCalculator
        });
        document.body.appendChild(element);
        const inputs = Array.from(element.shadowRoot.querySelectorAll('input'));
        inputs[0].value = 73;
        inputs[0].dispatchEvent(new CustomEvent('change'))
        inputs[1].value = 210;
        inputs[1].dispatchEvent(new CustomEvent('change'))
        const  button = element.shadowRoot.querySelector('button');
        button.click();
        await flushPromises();
        const recalcButton = element.shadowRoot.querySelector('.button-recalc');
        expect(recalcButton).not.toBeNull();
        recalcButton.click();
        await flushPromises();
        const results = element.shadowRoot.querySelector('.bmi-result');
        expect(results).toBeNull();
        const clearedInputs = Array.from(element.shadowRoot.querySelectorAll('input'));
        expect(clearedInputs.length).toBe(2);
        expect(clearedInputs[0].value).toBe('');
        expect(clearedInputs[1].value).toBe('');
    });

});
