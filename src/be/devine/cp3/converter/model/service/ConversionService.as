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
                        _appModel.value2 = Math.round((_appModel.value1*1.37)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*.73)*100)/100;
                    }
                break;
                case "length":
                    if(_appModel.value2 == ""){
                        _appModel.value2 = Math.round((_appModel.value1*0.393701)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*2.54)*100)/100;
                    }
                break;
                case "speed":
                    if(_appModel.value2 == ""){
                        _appModel.value2 = Math.round((_appModel.value1*0.621371)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*1.60934)*100)/100;
                    }
                break;
                case "temperature":
                    if(_appModel.value2 == ""){
                        _appModel.value2 = Math.round((_appModel.value1*33.800)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*17.222)*100)/100;
                    }
                break;
                case "weight":
                    if(_appModel.value2 == ""){
                        _appModel.value2 = Math.round((_appModel.value1*2.20462)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*0.453592)*100)/100;
                    }
                break;
                default:
                _appModel.value1 = _appModel.value2;
            }

    }
}
}
