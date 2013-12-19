/**
 * Created with IntelliJ IDEA.
 * User: woutthielemans
 * Date: 19/12/13
 * Time: 12:10
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.converter.view {
import be.devine.cp3.converter.components.Header;
import be.devine.cp3.converter.model.AppModel;

import feathers.controls.Header;
import feathers.controls.List;
import feathers.controls.Screen;
import feathers.data.ListCollection;
import feathers.skins.StandardIcons;

import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

import starling.events.Event;

import starling.textures.Texture;

public class Home extends Screen {

    private var header:feathers.controls.Header;
    private var conversionList:List;
    private var _appModel:AppModel;
    public var loader:URLLoader;
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
        header.title = "Conversion app";
        addChild(header);

        _appModel.load();
        _appModel.addEventListener(AppModel.COMPLETED_LOADING_JSON, loaderCompleteHandler);

        conversionList = new List();
        addChild(conversionList);

    }

    protected function loaderCompleteHandler(event:flash.events.Event):void {

        obj = _appModel.am_obj;
        conversionList.dataProvider = new ListCollection(obj.conversions);
        conversionList.itemRendererProperties.labelField = "title";
        /*conversionList.itemRendererProperties.accessoryTextureFunction = function(item:Object):Texture {
            return StandardIcons.listDrillDownAccessoryTexture;
        }*/
        conversionList.addEventListener(starling.events.Event.CHANGE, conversionListChangeHandler);

    }

    private function conversionListChangeHandler(event:starling.events.Event):void {

        dispatchEventWith("conversionSelected", false, conversionList.selectedItem);

    }
}
}
