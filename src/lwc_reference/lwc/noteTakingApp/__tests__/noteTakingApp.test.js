/**
 * Created by brooksjohnson on 4/19/24.
 */

import {createElement} from 'lwc';
import NoteTakingApp from "c/noteTakingApp";

describe('c-note-taking-app test suite', () => {
    afterEach( ()=> {
        if(document.body.firstChild){
            document.body.remove(document.body.firstChild);
        }
    })

    it('should render modal on click', () => {
        const element = createElement('c-note-taking-app', {
            is: NoteTakingApp
        })
        document.body.appendChild(element);
        const modal = element.querySelector('c-note-app-modal');
        expect(modal).toBe(null);


    });
})
