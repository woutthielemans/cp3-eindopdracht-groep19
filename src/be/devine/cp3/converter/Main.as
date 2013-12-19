package be.devine.cp3.converter {

import be.devine.cp3.converter.model.AppModel;
import be.devine.cp3.converter.view.Conversion;
import be.devine.cp3.converter.view.ConversionButton;
import be.devine.cp3.converter.view.Home;

import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;

import feathers.themes.MetalWorksMobileTheme;

import starling.display.Sprite;
import starling.events.Event;

public class Main extends Sprite {

    trace('in Main class');

    private var _appModel:AppModel;
    private var _conversionButton:ConversionButton;

    private static const HOME_SCREEN:String = "homeScreen";
    private static const CONVERSION_SCREEN:String = "conversionScreen";
    private static const HISTORY_SCREEN:String = "historyScreen";

    private var nav:ScreenNavigator;

    public function Main() {

        addEventListener(Event.ADDED_TO_STAGE, init);

    }

    private function init(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        stage.addEventListener(Event.RESIZE, resizeHandler);

        new MetalWorksMobileTheme();

        _appModel = AppModel.getInstance();

        layout();

        nav = new ScreenNavigator();
        addChild(nav);

        var homeScreen:ScreenNavigatorItem = new ScreenNavigatorItem(Home, {conversionSelected: selected}, null);
        nav.addScreen(HOME_SCREEN, homeScreen);

        var conversionScreen:ScreenNavigatorItem = new ScreenNavigatorItem(Conversion, {backHome: HOME_SCREEN}, null);
        nav.addScreen(CONVERSION_SCREEN, conversionScreen);

        nav.showScreen(HOME_SCREEN);
    }

    private function selected(e:Event, sc:Object):void{

    }

    private function resizeHandler(event:Event):void {
        layout();
    }

    private function layout():void {
        trace("[Starling]", stage.stageWidth, stage.stageHeight);
        /*_conversionButton.x = 10;
        _conversionButton.y = 10;
        _conversionButton.setSize(stage.stageWidth - 20, 50);*/
    }
}
}
