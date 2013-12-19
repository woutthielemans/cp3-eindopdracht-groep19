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
                        _appModel.value2 = Math.round((_appModel.value1*_appModel.currentConversion.euroToDollar)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*_appModel.currentConversion.dollarToEuro)*100)/100;
                    }
                break;
                case "length":
                    if(_appModel.value2 == ""){
                        _appModel.value2 = Math.round((_appModel.value1*_appModel.currentConversion.cmToInch)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*_appModel.currentConversion.inchToCm)*100)/100;
                    }
                break;
                case "speed":
                    if(_appModel.value2 == ""){
                        _appModel.value2 = Math.round((_appModel.value1*_appModel.currentConversion.kphToMph)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*_appModel.currentConversion.mphToKph)*100)/100;
                    }
                break;
                case "temperature":
                    if(_appModel.value2 == ""){
                        _appModel.value2 = Math.round((_appModel.value1*_appModel.currentConversion.celsiusToFahrenheit)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*_appModel.currentConversion.fahrenheitToCentimeter)*100)/100;
                    }
                break;
                case "weight":
                    if(_appModel.value2 == ""){
                        _appModel.value2 = Math.round((_appModel.value1*_appModel.currentConversion.kgToLbs)*100)/100;
                    }
                    if(_appModel.value1 == ""){
                        _appModel.value1 = Math.round((_appModel.value2*_appModel.currentConversion.lbsToKg)*100)/100;
                    }
                break;
                default:
                _appModel.value1 = _appModel.value2;
            }

    }
}
}
