/**
 * BigBlueButton open source conferencing system - http://www.bigbluebutton.org/
 * 
 * Copyright (c) 2012 BigBlueButton Inc. and by respective authors (see below).
 *
 * This program is free software; you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free Software
 * Foundation; either version 3.0 of the License, or (at your option) any later
 * version.
 * 
 * BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along
 * with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.
 *
 */
package org.bigbluebutton.modules.whiteboard.business.shapes
{
    import org.bigbluebutton.modules.whiteboard.models.Annotation;
    import org.bigbluebutton.modules.whiteboard.models.WhiteboardModel;
    import org.bigbluebutton.main.api.JSLog;

    public class EraserDrawAnnotation extends DrawAnnotation
    {
        private var _type:String = DrawObject.ERASER;
        private var _shape:Array;
        private var _color:uint;
        private var _fillColor:uint;
        private var _thickness:uint;
        private var _fill:Boolean;
        private var _transparent:Boolean;

        
        public function EraserDrawAnnotation(segment:Array, color:uint, thickness:uint, trans:Boolean)
        {
            _shape = segment;
	    _color = 0xFFFFFF;//color;
            var logData:Object = new Object();
	    JSLog.debug("EraserDrawAnnotation: Eraser Annotation color:" + color, logData);
	    _thickness = 30;//thickness;
	    JSLog.debug("EraserDrawAnnotation: Eraser Annotation thickness:" + thickness, logData);
            _transparent = trans;
        }
               
        override public function createAnnotation(wbModel:WhiteboardModel, ctrlKeyPressed:Boolean=false):Annotation {
            var ao:Object = new Object();
            ao["type"] = _type;
            ao["points"] = _shape;
            ao["color"] = 0xFFFFFF;//color;
            //var logData:Object = new Object();
	    //JSLog.debug("createAnnotation: Eraser Annotation color:" + _color, logData);
	    ao["thickness"] = 30;//_thickness;
            ao["id"] = _id;
            ao["status"] = _status;
            ao["transparency"] = _transparent;

            var wbId:String = wbModel.getCurrentWhiteboardId();
            if (wbId != null) {
              ao["whiteboardId"] = wbId;
            }
                      
            return new Annotation(_id, _type, ao);
        }
    }
}