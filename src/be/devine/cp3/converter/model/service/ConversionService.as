package be.devine.cp3.converter.model.service {

import be.devine.cp3.converter.model.AppModel;

import flash.display.Loader;
import flash.events.Event;

import flash.events.EventDispatcher;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class ConversionService extends EventDispatcher {

    public var loader:URLLoader;
    public var cs_obj:Object;
    private var _appModel:AppModel;
    private var _currentConversion:String;

    public function ConversionService() {

        _appModel = AppModel.getInstance();

    }

    public function calculate():void {

        _currentConversion = _appModel.currentConversion.title;

        switch(_currentConversion)
            {
                case "currency":
                        if(_appModel.value2 == ""){
                           _appModel.value2 = _appModel.value1*1.37;
                        }
                        if(_appModel.value1 == ""){
                            _appModel.value1 = _appModel.value2*.73;
                        }
                break;
                case "length":
                trace('[ConversionService] length');
                _appModel.value2 = _appModel.value1 * 3;
                break;
                case "speed":
                trace('[ConversionService] speed');
                _appModel.value2 = _appModel.value1 * 4;
                break;
                case "temperature":
                trace('[ConversionService] temperature');
                _appModel.value2 = _appModel.value1 * 5;
                break;
                case "weight":
                trace('[ConversionService] weight');
                _appModel.value2 = _appModel.value1 * 6;
                break;
                default:
                _appModel.value1 = _appModel.value2;
            }

    }
}
}
