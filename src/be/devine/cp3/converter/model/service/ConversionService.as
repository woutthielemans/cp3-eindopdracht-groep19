package be.devine.cp3.converter.model.service {

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class ConversionService extends EventDispatcher {

    public var conversions:Array;

    public function ConversionService() {
    }

    public function load():void {

        trace('parsing JSON file...');
        var conversionsFile:File = File.applicationStorageDirectory.resolvePath("conversions.json");
        if(!conversionsFile.exists) {
            var writeStream:FileStream = new FileStream();
            writeStream.open(conversionsFile, FileMode.WRITE);
            writeStream.writeUTFBytes(JSON.stringify([
                {
                    title: "Money",
                    formula: "money formula"
                },
                {
                    title: "Weight",
                    formula: "weight formula"
                },
                {
                    title: "Speed",
                    formula: "speed formula"
                },
                {
                    title: "Length",
                    formula: "length formula"
                },
                {
                    title: "Weather",
                    formula: "weather formula"
                }
            ]));
            writeStream.close();
        }
        var readStream:FileStream = new FileStream();
        readStream.open(conversionsFile, FileMode.READ);
        var str:String = readStream.readUTFBytes(readStream.bytesAvailable);
        var parsedJSON:Array = JSON.parse(str) as Array;
        readStream.close();
        var conversions:Array = [];
        for each(var conversion:Object in parsedJSON) {
            conversions.push(conversion);
        }
        this.conversions = conversions;
        dispatchEvent(new Event(Event.COMPLETE));

    }
}
}
