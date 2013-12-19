package be.devine.cp3.converter.model {
import be.devine.cp3.converter.view.ConversionButton;
import be.devine.cp3.converter.model.service.ConversionService;

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

public class AppModel extends EventDispatcher {

    public static const JSON_CHANGED:String = "jsonFileChanged";
    public static const CURRENT_CONVERSION_CHANGED:String = "currentConversionChanged";
    public static const COMPLETED_LOADING_JSON:String = "completedLoadingJson";

    private var _am_obj:Object;

    private static var instance:AppModel;

    private var currentConversionChanged:Boolean;
    private var _currentConversion:ConversionButton;
    public function get currentConversion():ConversionButton {
        return _currentConversion;
    }

    public function set currentConversion(value:ConversionButton):void {
        if (_currentConversion != value) {
            currentConversionChanged = true;
            _currentConversion = value;
            dispatchEvent(new Event(CURRENT_CONVERSION_CHANGED));
        }
    }

    public static function getInstance():AppModel {
        if (instance == null) {
            instance = new AppModel(new Enforcer());
        }
        return instance;
    }

    public function AppModel(e:Enforcer) {
        if (e == null) {
            throw new Error("AppModel is a singleton, use getInstance() instead");
        }
    }

    public function load():void {
        var conversionService:ConversionService = new ConversionService();
        conversionService.addEventListener(Event.COMPLETE, loadCompleteHandler);
        conversionService.load();
    }

    private function loadCompleteHandler(event:Event):void {
        var conversionService:ConversionService = event.target as ConversionService;
        this._am_obj = conversionService.cs_obj;
        dispatchEvent(new Event(COMPLETED_LOADING_JSON));
    }

    public function get am_obj():Object {
        return _am_obj;
    }

    public function set am_obj(value:Object):void {
        if (value != _am_obj) {
            _am_obj = value;
            dispatchEvent(new Event(JSON_CHANGED));
        }
    }
}
}
internal class Enforcer {
}