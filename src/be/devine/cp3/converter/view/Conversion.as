/**
 * Created with IntelliJ IDEA.
 * User: sorenselleslagh
 * Date: 16/12/13
 * Time: 14:30
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.converter.view {
import be.devine.cp3.converter.Main;

import feathers.controls.Button;
import feathers.controls.Header;

import feathers.controls.Label;

import feathers.controls.Screen;

import flash.events.Event;

import starling.display.DisplayObject;

import starling.events.Event;

public class Conversion extends Screen {

    private var header:Header;
    private var formula:Label;
    private var backButton:Button;
    public var currentConversion:Object;
    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;

    public function Conversion() {
    }

    override protected function draw():void{
        header.width = actualWidth;

        formula.width = actualWidth;
        formula.y = header.height + 20;
        formula.x = 20.
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


        formula = new Label();
        formula.text = currentConversion.formula;
        addChild(formula);

    }

    private function backButtonTriggeredHandler(event:starling.events.Event):void {

        dispatchEventWith("complete");

    }
}
}
