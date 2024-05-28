/**
 * Created by brooksjohnson on 4/12/24.
 */

import {LightningElement} from 'lwc';
import save_note from '@salesforce/apex/NoteTakingController.createNoteRecord'

const DEFAULT_NOTE_FORM  = {
    name: '',
    Note_Description__c: ''
}

export default class NoteTakingApp extends LightningElement {
    showModal = false;

    noteRecord = DEFAULT_NOTE_FORM;

    formats = [
        'font',
        'size',
        'bold',
        'italic',
        'underline',
        'strike',
        'list',
        'indent',
        'align',
        'link',
        'image',
        'clean',
        'table',
        'header',
        'color',
    ];

    get isFormValid(){
        return !(this.noteRecord && this.noteRecord.Note_Description__c && this.noteRecord.Name)
    }

    createNote(){
        this.showModal = true;
    }

    closeModal(){
        this.showModal = false;
        this.noteRecord = DEFAULT_NOTE_FORM;
    }
    handleChange(event){
        const {name, value } = event.target;
        this.noteRecord = {...this.noteRecord, [name]:value}
    }

    formSubmitHandler(event){
        event.preventDefault();
        console.log(JSON.stringify(this.noteRecord));
        save_note({noteRecord: JSON.stringify(this.noteRecord)})
            .then( () => {this.showModal = false})
            .catch(e => {console.error(e)})
    }

}