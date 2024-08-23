/**
 * Created by bjohnson on 2/8/24.
 */
// @ts-check
import {LightningElement} from 'lwc';
import AlarmClockAssets from '@salesforce/resourceUrl/alarm_clock_assets'

export default class AlarmClock extends LightningElement {
    clockImage = AlarmClockAssets+'/AlarmClockAssets/clock.png'
    ringTone = new Audio(AlarmClockAssets+'/AlarmClockAssets/Clocksound.mp3');
    currentTime;
    alarmTime = {};
    hours = [];
    minutes = [];
    amPm = ['AM', 'PM']
    alarmSet =false;
    isAlarmTriggered = false;
    hourSelected;
    minuteSelected;
    meridianSelected;

    connectedCallback() {
        this.createHours();
        this.createMinutes();
        this.displayTime();
    }

    displayTime(){
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        setInterval(() => {
            const now = new Date();
            let hour = now.getHours();
            let minute = now.getMinutes();
            let seconds = now.getSeconds();
            const amPm = hour >= 12 ? 'PM' : 'AM';
            hour = hour % 12;
            hour = hour ? hour : 12;
            hour = hour < 10 ? '0' + hour : hour;
            minute = minute < 10 ? '0' + minute : minute;
            seconds = seconds < 10 ? '0' + seconds : seconds;
            this.currentTime = `${hour}:${minute}:${seconds} ${amPm}`
            if(this.alarmTime && this.alarmSet){
                if(this.alarmTime === `${hour}:${minute} ${amPm}`){
                    console.log('alarm')
                    this.isAlarmTriggered = true;
                    this.ringTone.play();
                    this.ringTone.loop = true;
                }
            }
        }, 1000)
    }


    createMinutes(){
        for (let i = 1; i < 61; i++) {
            if (i < 10){
                i = `0${i}`
            }
            this.minutes = [...this.minutes, i];
        }
    }

    createHours(){
        for (let i = 1; i < 13; i++) {
           if(i < 10){
               i = `0${i}`
           }
           this.hours = [...this.hours, i];
        }
    }

    handleOptionChange(event){
        const {name, value } = event.detail;
        console.log(name)
        switch (name) {
            case 'hours':
                this.hourSelected = value;
                break;
            case 'minutes':
                this.minuteSelected = value;
                break;
            default:
                this.meridianSelected = value;
        }
    }

    setAlarm(){
      this.alarmTime = `${this.hourSelected}:${this.minuteSelected} ${this.meridianSelected}`
        this.alarmSet = true;
    }

    clearAlarm(){
        this.alarmTime = '';
        this.alarmSet = false;
        this.hourSelected = '';
        this.minuteSelected = '';
        this.meridianSelected = '';
        const children = this.template.querySelectorAll('c-clock-drop-down');
        children.forEach(child => child.reset(''));
        this.isAlarmTriggered = false;
        this.ringTone.pause();
    }


    get areFieldsSelected(){
        return !(this.hourSelected && this.minuteSelected && this.meridianSelected);
    }

    get triggerAlarm(){
        console.log('calling shake ' + this.isAlarmTriggered);

        return this.isAlarmTriggered ? 'shake' : '';
    }

}