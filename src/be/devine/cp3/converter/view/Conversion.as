package be.devine.cp3.converter.view {
import be.devine.cp3.converter.Main;
import be.devine.cp3.converter.model.AppModel;

import feathers.controls.Button;
import feathers.controls.Header;

import feathers.controls.Label;
import feathers.controls.LayoutGroup;

import feathers.controls.Screen;
import feathers.controls.TextInput;
import feathers.events.FeathersEventType;

import flash.events.Event;


import starling.display.DisplayObject;

import starling.events.Event;
import starling.textures.TextureAtlas;

public class Conversion extends Screen {

    [Embed(source="/../assets/custom/spritesheet.png")]
    protected static const ATLAS_IMAGE:Class;

    [Embed(source="/../assets/custom/spritesheet.xml", mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    private var _atlas:TextureAtlas;

    private var header:Header;
    private var input1:TextInput;
    private var label1:Label;
    private var label2:Label;
    private var input2:TextInput;
    private var value1:Number;
    private var value2:Number;
    private var convertButton:Button;
    private var backButton:Button;
    public var currentConversion:Object;
    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;
    private var _appModel:AppModel;

    public function Conversion() {
    }

    override protected function draw():void{
        header.width = actualWidth;

        input1.width = ((actualWidth/3)*2)-60;
        input1.x = (actualWidth/2 - input1.width/2)-25;
        input1.y = header.height + 20;

        label1.width = 50;
        label1.x = input1.x + input1.width + 5;
        label1.y = input1.y;

        convertButton.width = 100;
        convertButton.x = actualWidth/2 - convertButton.width/2;
        convertButton.y = input1.y + input1.height + 30;

        input2.width = ((actualWidth/3)*2)-60;
        input2.x = (actualWidth/2 - input2.width/2)-25;
        input2.y = convertButton.y + convertButton.height + 30;

        label2.width = 50;
        label2.x = input2.x + input2.width + 5;
        label2.y = input2.y;
    }

    override protected function initialize():void{

        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.VALUES_CHANGED, valuesChangedHandler);

        currentConversion = _appModel.currentConversion;

        header = new Header();
        header.title = currentConversion.title;
        addChild(header);

        var backButton:Button = new Button();
        backButton.label = "Back";
        backButton.addEventListener( starling.events.Event.TRIGGERED, backButtonTriggeredHandler );
        header.leftItems = new <DisplayObject>[ backButton ];

        input1 = new TextInput();
        input1.textEditorProperties.restrict = "0-9 .";
        input1.addEventListener(starling.events.Event.CHANGE, input1ChangeHandler);
        input1.addEventListener(FeathersEventType.FOCUS_IN, input1FocusHandler);
        this.addChild( input1 );

        label1 = new Label();
        label1.text = _appModel.currentConversion.label1;
        addChild(label1);

        convertButton = new Button();
        convertButton.label = "convert";
        convertButton.addEventListener( starling.events.Event.TRIGGERED, convertButtonTriggeredHandler );
        this.addChild(convertButton);

        input2 = new TextInput();
        input2.textEditorProperties.restrict = "0-9 .";
        input2.addEventListener(starling.events.Event.CHANGE, input2ChangeHandler);
        input2.addEventListener(FeathersEventType.FOCUS_IN, input2FocusHandler);
        this.addChild( input2 );

        label2 = new Label();
        label2.text = _appModel.currentConversion.label2;
        addChild(label2);

    }

    private function backButtonTriggeredHandler(event:starling.events.Event):void {

        dispatchEventWith("complete");

    }

    private function convertButtonTriggeredHandler(event:starling.events.Event):void {

        _appModel.calculate();

    }

    private function input1ChangeHandler(event:starling.events.Event):void {

        _appModel.value1 = Number(input1.text);

    }

    private function input2ChangeHandler(event:starling.events.Event):void {

        _appModel.value2 = Number(input2.text);

    }

    private function input1FocusHandler(event:starling.events.Event):void {

        input2.text = "";

    }

    private function input2FocusHandler(event:starling.events.Event):void {

        input1.text = "";

    }

    private function valuesChangedHandler(event:flash.events.Event):void {

        if(!isNaN(_appModel.value1)){
            input1.text = _appModel.value1.toString();
            if(_appModel.value1 == 0){
                input1.text = "";
            }
        }else if(isNaN(_appModel.value1)){
            input1.text = "";
        }

        if(!isNaN(_appModel.value2)){
            input2.text = _appModel.value2.toString();
            if(_appModel.value2 == 0){
                input2.text = "";
            }
        }else if(isNaN(_appModel.value2)){
            input2.text = "";
        }

    }
}
}
