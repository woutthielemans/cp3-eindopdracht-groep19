package be.devine.cp3.converter {

import be.devine.cp3.converter.components.ConversionButton;
import be.devine.cp3.converter.components.ConversionGroup;
import be.devine.cp3.converter.model.AppModel;

import feathers.themes.MetalWorksMobileTheme;

import feathers.themes.MetalWorksMobileTheme;

import starling.display.Sprite;
import starling.events.Event;

public class Main extends Sprite {

    trace('in Main class');

    private var _appModel:AppModel;
    private var _conversionButton:ConversionButton;
    private var _conversionGroup:ConversionGroup;

    public function Main() {

        addEventListener(Event.ADDED_TO_STAGE, addedHandler);

        new MetalWorksMobileTheme();

        _appModel = AppModel.getInstance();

        trace('telling AppModel to start parsing JSON file');
        _appModel.load();

        _conversionButton = new ConversionButton();
        addChild(_conversionButton);

    }

    private function addedHandler(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
        stage.addEventListener(Event.RESIZE, resizeHandler);
        layout();
    }

    private function resizeHandler(event:Event):void {
        layout();
    }

    private function layout():void {
        trace("[Starling]", stage.stageWidth, stage.stageHeight);
        _conversionButton.x = 10;
        _conversionButton.y = 10;
        _conversionButton.setSize(stage.stageWidth - 20, 50);
    }
}
}
