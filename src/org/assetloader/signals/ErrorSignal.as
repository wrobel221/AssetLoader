package org.assetloader.signals
{
	import org.assetloader.core.ILoader;

	/**
	 * @author Matan Uberstein
	 */
	public class ErrorSignal extends LoaderSignal
	{
		/**
		 * @private
		 */
		protected var _type : String;
		/**
		 * @private
		 */
		protected var _message : String;

		public function ErrorSignal(loader : ILoader, ...valueClasses)
		{
			_signalType = ErrorSignal;
			super(loader, valueClasses);
		}

		/**
		 * Dispatches Signal.
		 * 
		 * @param args1 String - Error type
		 * @param args2 String - Error message
		 */
		override public function dispatch(...args) : void
		{
			_type = args.shift();
			_message = args.shift();
			super.dispatch.apply(null, args);
		}

		/**
		 * Gets the error type.
		 * 
		 * @return String
		 */
		public function get type() : String
		{
			return _type;
		}

		/**
		 * Gets the error message.
		 * 
		 * @return String
		 */
		public function get message() : String
		{
			return _message;
		}
	}
}
