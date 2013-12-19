package be.devine.cp3.converter.view {
import be.devine.cp3.converter.Main;
import be.devine.cp3.converter.model.AppModel;

import feathers.controls.Button;
import feathers.controls.Header;

import feathers.controls.Label;

import feathers.controls.Screen;
import feathers.controls.TextInput;
import feathers.events.FeathersEventType;

import flash.events.Event;

import starling.display.DisplayObject;

import starling.events.Event;

public class Conversion extends Screen {

    private var header:Header;
    private var input1:TextInput;
    private var input2:TextInput;
    private var value1:Number;
    private var value2:Number;
    private var convButton:Button;
    private var backButton:Button;
    public var currentConversion:Object;
    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;
    private var _appModel:AppModel;

    public function Conversion() {
    }

    override protected function draw():void{
        header.width = actualWidth;

        input1.width = (actualWidth/3)*2;
        input1.x = actualWidth/2 - input1.width/2;
        input1.y = header.height + 20;

        input2.width = (actualWidth/3)*2;
        input2.x = actualWidth/2 - input2.width/2;
        input2.y = input1.y + input1.height + 100;
    }

    override protected function initialize():void{

        _appModel = AppModel.getInstance();

        currentConversion = _appModel.currentConversion;

        header = new Header();
        header.title = currentConversion.title;
        addChild(header);

        var backButton:Button = new Button();
        backButton.label = "Back";
        backButton.addEventListener( starling.events.Event.TRIGGERED, backButtonTriggeredHandler );
        header.leftItems = new <DisplayObject>[ backButton ];

        input1 = new TextInput();
        input1.prompt = "0";
        input1.textEditorProperties.restrict = "0-9";
        input1.addEventListener(starling.events.Event.CHANGE, input1ChangeHandler);
        //input1.addEventListener(feathers.events.FeathersEventType.FOCUS_IN, input1FocusHandler);
        this.addChild( input1 );

        input2 = new TextInput();
        input2.prompt = "0";
        input2.textEditorProperties.restrict = "0-9";
        input2.addEventListener(starling.events.Event.CHANGE, input2ChangeHandler);
        this.addChild( input2 );

    }

    private function backButtonTriggeredHandler(event:starling.events.Event):void {

        dispatchEventWith("complete");

    }

    private function input1ChangeHandler(event:starling.events.Event):void {

        /*value1 = Number(input1.text);
        value2 = 2*value1;
        input2.text = value2.toString();*/

        _appModel.calculate();
        _appModel.value1 = Number(input1.text);

    }

    private function input2ChangeHandler(event:starling.events.Event):void {

        /*value2 = Number(input2.text);
        value1 = value2/2;
        input1.text = value1.toString();*/

        _appModel.calculate();
        _appModel.value2 = Number(input2.text);

    }

}
}
