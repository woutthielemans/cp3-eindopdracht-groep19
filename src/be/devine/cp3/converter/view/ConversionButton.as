package be.devine.cp3.converter.view {
import be.devine.cp3.converter.model.AppModel;

import feathers.controls.Button;

import feathers.controls.Label;
import feathers.controls.List;
import feathers.controls.ScreenNavigator;
import feathers.data.ListCollection;

import flash.events.Event;
import flash.events.MouseEvent;

import starling.events.Event;

//import flash.text.TextField;

import starling.display.Sprite;

public class ConversionButton extends Sprite{

    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;
    private var yPos = 80;

    private var _appModel:AppModel;

    private var _conversionsButton:Button;
    private var _conversionsList:Array;


    public function ConversionButton() {

        _appModel = AppModel.getInstance();

        _conversionsList = _appModel.conversions;

        for each(var conversion:Object in _appModel.conversions){

            trace(conversion["title"]);

            _conversionsButton = new Button();
            _conversionsButton.label = conversion["title"];
            _conversionsButton.setSize(200,50);
            addChild(_conversionsButton);
            _conversionsButton.y = yPos;
            yPos += 50;
        }
    }

    private function triggeredHandler(event:Event):void {

    }

    public function setSize(w:Number, h:Number):void {
        _explicitWidth = w;
        _explicitHeight = h;
    }
}
}