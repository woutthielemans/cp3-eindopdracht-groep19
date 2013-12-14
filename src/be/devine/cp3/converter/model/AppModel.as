package be.devine.cp3.converter.model {
import be.devine.cp3.converter.components.ConversionButton;
import be.devine.cp3.converter.model.service.ConversionService;

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

public class AppModel extends EventDispatcher {

    public static const CONVERSIONS_CHANGED:String = "conversionsChanged";
    public static const CURRENT_CONVERSION_CHANGED:String = "currentConversionChanged";

    private var _conversions:Array;

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
        _conversions = [];
    }

    public function load():void {
        var conversionService:ConversionService = new ConversionService();
        conversionService.addEventListener(Event.COMPLETE, loadCompleteHandler);
        conversionService.load();
    }

    private function loadCompleteHandler(event:Event):void {
        var conversionService:ConversionService = event.target as ConversionService;
        this._conversions = conversionService.conversions;
        trace("[AppModel] _appModel.conversions = " + this.conversions);
    }

    public function get conversions():Array {
        return _conversions;
    }

    public function set conversions(value:Array):void {
        if (value != _conversions) {
            _conversions = value;
            dispatchEvent(new Event(CONVERSIONS_CHANGED));
        }
    }
}
}
internal class Enforcer {
}