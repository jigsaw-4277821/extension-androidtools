package android.jni;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import lime.system.JNI;

/**
 * A utility class for caching JNI method and field references.
 */
class JNICache
{
	private static var staticMethodCache:Map<String, Dynamic> = [];
	private static var memberMethodCache:Map<String, Dynamic> = [];
	private static var staticFieldCache:Map<String, JNIStaticField> = [];
	private static var memberFieldCache:Map<String, JNIMemberField> = [];

	/**
	 * Retrieves or creates a cached static method reference.
	 * @param className The name of the Java class containing the method.
	 * @param methodName The name of the method.
	 * @param signature The method signature in JNI format.
	 * @return A dynamic reference to the static method.
	 */
	public static function createStaticMethod(className:String, methodName:String, signature:String):Dynamic
	{
		final key:String = '$className::$methodName::$signature';

		if (!staticMethodCache.exists(key))
			staticMethodCache.set(key, JNI.createStaticMethod(className, methodName, signature));

		return staticMethodCache.get(key);
	}

	/**
	 * Retrieves or creates a cached member method reference.
	 * @param className The name of the Java class containing the method.
	 * @param methodName The name of the method.
	 * @param signature The method signature in JNI format.
	 * @return A dynamic reference to the member method.
	 */
	public static function createMemberMethod(className:String, methodName:String, signature:String):Dynamic
	{
		final key:String = '$className::$methodName::$signature';

		if (!memberMethodCache.exists(key))
			memberMethodCache.set(key, JNI.createMemberMethod(className, methodName, signature));

		return memberMethodCache.get(key);
	}

	/**
	 * Retrieves or creates a cached static field reference.
	 * @param className The name of the Java class containing the field.
	 * @param fieldName The name of the field.
	 * @param signature The field signature in JNI format.
	 * @return A reference to the static field.
	 */
	public static function createStaticField(className:String, fieldName:String, signature:String):JNIStaticField
	{
		final key:String = '$className::$fieldName::$signature';

		if (!staticFieldCache.exists(key))
			staticFieldCache.set(key, JNI.createStaticField(className, fieldName, signature));

		return staticFieldCache.get(key);
	}

	/**
	 * Retrieves or creates a cached member field reference.
	 * @param className The name of the Java class containing the field.
	 * @param fieldName The name of the field.
	 * @param signature The field signature in JNI format.
	 * @return A reference to the member field.
	 */
	public static function createMemberField(className:String, fieldName:String, signature:String):JNIMemberField
	{
		final key:String = '$className::$fieldName::$signature';

		if (!memberFieldCache.exists(key))
			memberFieldCache.set(key, JNI.createMemberField(className, fieldName, signature));

		return memberFieldCache.get(key);
	}
}
