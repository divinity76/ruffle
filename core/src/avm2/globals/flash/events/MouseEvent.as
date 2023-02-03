
package flash.events
{
    import flash.display.InteractiveObject;
    import __ruffle__.log_warn;

    public class MouseEvent extends Event
    {
        public static const CLICK:String = "click";
        public static const DOUBLE_CLICK:String = "doubleClick";
        public static const MOUSE_DOWN:String = "mouseDown";
        public static const MOUSE_MOVE:String = "mouseMove";
        public static const MOUSE_OUT:String = "mouseOut";
        public static const MOUSE_OVER:String = "mouseOver";
        public static const MOUSE_UP:String = "mouseUp";
        public static const RELEASE_OUTSIDE:String = "releaseOutside";
        public static const MOUSE_WHEEL:String = "mouseWheel";
        public static const ROLL_OUT:String = "rollOut";
        public static const ROLL_OVER:String = "rollOver";
        public static const MIDDLE_CLICK:String = "middleClick";
        public static const MIDDLE_MOUSE_DOWN:String = "middleMouseDown";
        public static const MIDDLE_MOUSE_UP:String = "middleMouseUp";
        public static const RIGHT_CLICK:String = "rightClick";
        public static const RIGHT_MOUSE_DOWN:String = "rightMouseDown";
        public static const RIGHT_MOUSE_UP:String = "rightMouseUp";
        public static const CONTEXT_MENU:String = "contextMenu";

        public var relatedObject: InteractiveObject;
        public var localX: Number;
        public var localY: Number;
        public var ctrlKey: Boolean;
        public var altKey: Boolean;
        public var shiftKey: Boolean;
        public var buttonDown: Boolean;
        public var delta: int;
        public var isRelatedObjectInaccessible: Boolean;

        public var movementX: Number;
        public var movementY: Number;

        public function MouseEvent(type:String, 
                                   bubbles:Boolean = true, 
                                   cancelable:Boolean = false, 
                                   localX:Number = 0/0, 
                                   localY:Number = 0/0, 
                                   relatedObject:InteractiveObject = null, 
                                   ctrlKey:Boolean = false, 
                                   altKey:Boolean = false, 
                                   shiftKey:Boolean = false, 
                                   buttonDown:Boolean = false, 
                                   delta:int = 0)
        {
            super(type,bubbles,cancelable);
            this.localX = localX;
            this.localY = localY;
            this.relatedObject = relatedObject;
            this.ctrlKey = ctrlKey;
            this.altKey = altKey;
            this.shiftKey = shiftKey;
            this.buttonDown = buttonDown;
            this.delta = delta;
            this.isRelatedObjectInaccessible = false; // unimplemented

            this.movementX = 0.0; // unimplemented
            this.movementY = 0.0; // unimplemented
        }

        override public function clone() : Event
        {
            // note: movementX/Y not cloned
            return new MouseEvent(this.type,this.bubbles,this.cancelable,this.localX,this.localY,this.relatedObject,this.ctrlKey,this.altKey,this.shiftKey,this.buttonDown,this.delta);
        }

        override public function toString() : String
        {
            return this.formatToString("MouseEvent","type","bubbles","cancelable","eventPhase","localX","localY","stageX","stageY","relatedObject","ctrlKey","altKey","shiftKey","buttonDown","delta");
        }

        public function updateAfterEvent():void {
            // TODO - determine when we should actually force a frame to be rendered.
            log_warn("MouseEvent.updateAfterEvent is not yet implemented");
        }

        public native function get stageX() : Number;
        public native function get stageY() : Number;
    }
}
