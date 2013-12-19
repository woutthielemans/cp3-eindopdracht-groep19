package be.devine.cp3.converter.view {
import be.devine.cp3.converter.Main;

import feathers.controls.Button;
import feathers.controls.Header;

import feathers.controls.Label;

import feathers.controls.Screen;
import feathers.controls.TextInput;

import flash.events.Event;

import starling.display.DisplayObject;

import starling.events.Event;

public class Conversion extends Screen {

    private var header:Header;
    private var input1:TextInput;
    private var input2:TextInput;
    private var convButton:Button;
    private var backButton:Button;
    public var currentConversion:Object;
    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;

    public function Conversion() {
    }

    override protected function draw():void{
        header.width = actualWidth;

        input1.width = (actualWidth/3)*2;
        input1.x = actualWidth/2 - input1.width/2;
        input1.y = header.height + 20;

        input2.width = (actualWidth/3)*2;
        input2.x = actualWidth/2 - input2.width/2;
        input2.y = convButton.y + convButton.height + 30;
    }

    override protected function initialize():void{

        currentConversion = Main.selectedItem;

        header = new Header();
        header.title = currentConversion.title;
        addChild(header);

        var backButton:Button = new Button();
        backButton.label = "Back";
        backButton.addEventListener( starling.events.Event.TRIGGERED, backButtonTriggeredHandler );
        header.leftItems = new <DisplayObject>[ backButton ];

        input1 = new TextInput();
        input1.prompt = "value 1";
        this.addChild( input1 );

        input2 = new TextInput();
        input2.prompt = "value 2";
        this.addChild( input2 );

    }

    private function backButtonTriggeredHandler(event:starling.events.Event):void {

        dispatchEventWith("complete");

    }

    private function convButtonTriggeredHandler(event:starling.events.Event):void {

        // convert

    }

}
}
