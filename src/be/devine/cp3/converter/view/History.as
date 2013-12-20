package be.devine.cp3.converter.view {

import feathers.controls.Button;
import feathers.controls.Header;

import feathers.controls.Label;
import feathers.controls.LayoutGroup;

import feathers.controls.Screen;

import starling.display.DisplayObject;

import starling.events.Event;
import starling.textures.TextureAtlas;

public class History extends Screen {

    [Embed(source="/../assets/custom/spritesheet.png")]
    protected static const ATLAS_IMAGE:Class;

    [Embed(source="/../assets/custom/spritesheet.xml", mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    private var _atlas:TextureAtlas;

    private var header:Header;
    private var formula:Label;

    public function History() {
    }

    override protected function draw():void{
        header.width = actualWidth;
    }

    override protected function initialize():void{

        header = new Header();
        header.title = "History";
        addChild(header);

        var backButton:Button = new Button();
        backButton.label = "Back";
        backButton.addEventListener( starling.events.Event.TRIGGERED, backButtonTriggeredHandler );
        header.leftItems = new <DisplayObject>[ backButton ];

    }

    private function backButtonTriggeredHandler(event:starling.events.Event):void {

        dispatchEventWith("complete");

    }

}
}
