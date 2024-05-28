/**
 * Created by brooksjohnson on 4/26/24.
 */

import {LightningElement, api} from 'lwc';
import LightningModal from "lightning/modal";

export default class MascotPickerModal extends LightningModal {
    @api recordId;

    connectedCallback(){
        console.log('recordId', this.recordId)
    }

    selectedMascot;

    handleSelect(event){
        this.selectedMascot = event.detail;
    }

    handleConfirm(){
        this.dispatchEvent(new CustomEvent('confirm', {detail: this.selectedMascot}));
        this.close(this.selectedMascot)
    }


}