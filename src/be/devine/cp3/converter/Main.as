package be.devine.cp3.converter {

import be.devine.cp3.converter.model.AppModel;
import be.devine.cp3.converter.view.Conversion;
import be.devine.cp3.converter.view.History;
import be.devine.cp3.converter.view.Home;

import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;
import feathers.motion.transitions.ScreenSlidingStackTransitionManager;

import feathers.themes.MetalWorksMobileTheme;

import starling.display.Sprite;
import starling.events.Event;

public class Main extends Sprite {

    private var _appModel:AppModel;

    private static const HOME_SCREEN:String = "homeScreen";
    private static const CONVERSION_SCREEN:String = "conversionScreen";
    private static const HISTORY_SCREEN:String = "historyScreen";

    private var nav:ScreenNavigator;
    public static var selectedItem:Object;

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

        var transition:ScreenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager(nav);

        var homeScreen:ScreenNavigatorItem = new ScreenNavigatorItem(Home, {conversionSelected: selected, history: HISTORY_SCREEN}, null);
        nav.addScreen(HOME_SCREEN, homeScreen);

        var conversionScreen:ScreenNavigatorItem = new ScreenNavigatorItem(Conversion, {complete: HOME_SCREEN}, null);
        nav.addScreen(CONVERSION_SCREEN, conversionScreen);

        var historyScreen:ScreenNavigatorItem = new ScreenNavigatorItem(History, {complete: HOME_SCREEN}, null);
        nav.addScreen(HISTORY_SCREEN, historyScreen);

        nav.showScreen(HOME_SCREEN);
    }

    private function selected(e:Event, sc:Object):void{
        _appModel.value1 = 0;
        _appModel.value2 = 0;
        selectedItem = sc;
        _appModel.currentConversion = selectedItem;
        nav.showScreen(CONVERSION_SCREEN);

    }

    private function resizeHandler(event:Event):void {
        layout();
    }

    private function layout():void {

    }
}
}
