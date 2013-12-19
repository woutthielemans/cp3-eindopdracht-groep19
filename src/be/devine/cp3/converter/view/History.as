package be.devine.cp3.converter.view {

import feathers.controls.Button;
import feathers.controls.Header;

import feathers.controls.Label;

import feathers.controls.Screen;

import starling.display.DisplayObject;

import starling.events.Event;

public class History extends Screen {

    private var header:Header;
    private var formula:Label;

    public function History() {
    }

    override protected function draw():void{
        header.width = actualWidth;
    }

    override protected function initialize():void{

        header = new Header();
        header.title = "History";
        addChild(header);

        var backButton:Button = new Button();
        backButton.label = "Back";
        backButton.addEventListener( starling.events.Event.TRIGGERED, backButtonTriggeredHandler );
        header.leftItems = new <DisplayObject>[ backButton ];

    }

    private function backButtonTriggeredHandler(event:starling.events.Event):void {

        dispatchEventWith("complete");

    }

}
}
