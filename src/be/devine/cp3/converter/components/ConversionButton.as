package be.devine.cp3.converter.components {
import be.devine.cp3.converter.model.AppModel;

import feathers.controls.Button;

import feathers.controls.Label;
import feathers.controls.List;
import feathers.data.ListCollection;

import flash.events.Event;

import starling.events.Event;

//import flash.text.TextField;

import starling.display.Sprite;

public class ConversionButton extends Sprite{

    trace('in ConversionButton class');

    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;
    private var yPos = 80;

    private var _appModel:AppModel;

    private var _conversionsButton:Button;
    private var _conversionsList:Array;

    public function ConversionButton() {

        _appModel = AppModel.getInstance();

        _conversionsList = _appModel.conversions;
        trace("[ConversionsButton] _appModel.conversions = " + _appModel.conversions);

        for each(var conversion:Object in _appModel.conversions){

            trace(conversion["title"]);

            _conversionsButton = new Button();
            _conversionsButton.setSize(50,50);
            addChild(_conversionsButton);
            _conversionsButton.y = yPos;
            yPos += 50;

        }
    }

    public function setSize(w:Number, h:Number):void {
        _explicitWidth = w;
        _explicitHeight = h;
    }
}
}
