package be.devine.cp3.converter.model.service {

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

    public function ConversionService() {
    }

    public function load():void {

        loader = new URLLoader(new URLRequest("assets/conversions.json"));
        loader.addEventListener(flash.events.Event.COMPLETE, loaderCompleteHandler);

    }

    private function loaderCompleteHandler(event:Event):void {

        cs_obj = JSON.parse(loader.data);
        dispatchEvent(new Event(Event.COMPLETE));

    }
}
}
