/**
 * Created with IntelliJ IDEA.
 * User: sorenselleslagh
 * Date: 06/12/13
 * Time: 17:34
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.converter.model {
import be.devine.cp3.converter.model.service.ConversionService;

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

public class AppModel extends EventDispatcher {

    public static const CONVERSIONS_CHANGED:String = "conversionsChanged";

    private var _conversions:Array;

    // AppModel wordt instance om aanmaken meerdere AppModels onmogelijk te maken
    // hiervoor enkele lijnen code en Enforcer class als beveiliging

    private static var instance:AppModel;

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