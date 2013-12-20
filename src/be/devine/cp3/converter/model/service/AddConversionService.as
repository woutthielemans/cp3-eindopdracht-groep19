/**
 * Created with IntelliJ IDEA.
 * User: woutthielemans
 * Date: 20/12/13
 * Time: 00:55
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.converter.model.service {
import be.devine.cp3.converter.model.AppModel;

import starling.events.EventDispatcher;

public class AddConversionService extends EventDispatcher {

    private var _appModel:AppModel;

    public function AddConversionService() {

        _appModel = AppModel.getInstance();

    }

    public function push():void{

    }
}
}
