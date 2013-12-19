package be.devine.cp3.converter.model {
import be.devine.cp3.converter.model.service.ConversionService;
import be.devine.cp3.converter.model.service.LoaderService;

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

public class AppModel extends EventDispatcher {

    public static const JSON_CHANGED:String = "jsonFileChanged";
    public static const CURRENT_CONVERSION_CHANGED:String = "currentConversionChanged";
    public static const VALUES_CHANGED:String = "valuesChanged";
    public static const COMPLETED_LOADING_JSON:String = "completedLoadingJson";

    private var _am_obj:Object;
    private var _value1:Number;
    private var _value1Changed:Boolean;
    private var _value2:Number;
    private var _value2Changed:Boolean;

    private static var instance:AppModel;

    private var loaderService:LoaderService;
    private var conversionService:ConversionService;

    private var currentConversionChanged:Boolean;
    private var _currentConversion:Object;
    public function get currentConversion():Object {
        return _currentConversion;
    }

    public function set currentConversion(value:Object):void {
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
        loaderService = new LoaderService();
        loaderService.addEventListener(Event.COMPLETE, loadCompleteHandler);
        loaderService.load();
    }

    private function loadCompleteHandler(event:Event):void {
        var loaderService:LoaderService = event.target as LoaderService;
        this._am_obj = loaderService.cs_obj;
        dispatchEvent(new Event(COMPLETED_LOADING_JSON));
    }

    public function calculate():void{
        trace('[Appmodel] Calculate conversion.');
        conversionService = new ConversionService();
        conversionService.calculate();
        dispatchEvent(new Event(VALUES_CHANGED));
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

    public function get value1():Number {
        return _value1;
    }

    public function set value1(value:Number):void {
        if (_value1 != value) {
            _value1Changed = true;
            _value1 = value;
            dispatchEvent(new Event(VALUES_CHANGED));
        }
    }

    public function get value2():Number {
        return _value2;
    }

    public function set value2(value:Number):void {
        if (_value2 != value) {
            _value2Changed = true;
            _value2 = value;
            dispatchEvent(new Event(VALUES_CHANGED));
        }
    }
}
}
internal class Enforcer {
}