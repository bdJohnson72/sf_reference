/**
 * Created by brooksjohnson on 6/4/24.
 */

import {LightningElement, api} from 'lwc';

export default class SetterDemoChild extends LightningElement {
    userDetail;

    @api
    get detail(){
        return this.userDetail;
    }

    set detail(data){
        const newAge = data.age * 2;
        this.userDetail = {...data, age: newAge};
    }
}