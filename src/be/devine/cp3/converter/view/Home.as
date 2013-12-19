package be.devine.cp3.converter.view {
import be.devine.cp3.converter.components.Header;
import be.devine.cp3.converter.model.AppModel;

import feathers.controls.Button;

import feathers.controls.Header;
import feathers.controls.List;
import feathers.controls.Screen;
import feathers.data.ListCollection;
import feathers.skins.StandardIcons;

import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

import starling.display.Button;
import starling.display.DisplayObject;

import starling.events.Event;

import starling.textures.Texture;

public class Home extends Screen {

    private var header:feathers.controls.Header;
    private var conversionList:List;
    private var _appModel:AppModel;
    public var obj:Object;

    public function Home() {

        _appModel = AppModel.getInstance();

    }

    override protected function draw():void{
        header.width = actualWidth;

        conversionList.y = header.height;
        conversionList.width = actualWidth;
        conversionList.height = actualHeight - header.height;
    }

    override protected function initialize():void{

        header = new feathers.controls.Header();
        header.title = "Home";
        addChild(header);

        var historyButton:feathers.controls.Button = new feathers.controls.Button();
        historyButton.label = "History";
        historyButton.addEventListener(starling.events.Event.TRIGGERED, historyButtonTriggeredHandler);
        header.rightItems = new <DisplayObject>[ historyButton ];

        _appModel.load();
        _appModel.addEventListener(AppModel.COMPLETED_LOADING_JSON, loaderCompleteHandler);

        conversionList = new List();
        addChild(conversionList);

    }

    protected function loaderCompleteHandler(event:flash.events.Event):void {

        obj = _appModel.am_obj;
        conversionList.dataProvider = new ListCollection(obj.conversions);
        conversionList.itemRendererProperties.labelField = "title";
        conversionList.addEventListener(starling.events.Event.CHANGE, conversionListChangeHandler);

    }

    private function conversionListChangeHandler(event:starling.events.Event):void {

        dispatchEventWith("conversionSelected", false, conversionList.selectedItem);

    }

    private function historyButtonTriggeredHandler(e:starling.events.Event):void{

        dispatchEventWith("history");

    }
}
}
